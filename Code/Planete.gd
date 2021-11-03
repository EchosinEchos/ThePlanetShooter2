tool
extends gravity_attractor

var planeteDir:Directory = Directory.new()

var planeteTexture:Array

func change_size():
	var cScale : Vector2 = Vector2.ONE *  (self.radius / 500.0)
	$Sprite.scale = cScale
	$CollisionShape2D.shape.set_radius(self.radius)

func _ready():
	add_to_group("planete")
	$CollisionShape2D.shape = CircleShape2D.new()
	change_size()
	
	if $Sprite.texture == null:
		loadTexture("res://Image/Planete/")
		$Sprite.texture = planeteTexture[randi()%planeteTexture.size()]



func _process(_delta):
	if Engine.editor_hint:
		change_size()
		
		
func loadTexture(path):
	planeteDir.open(path)
	planeteDir.list_dir_begin()
	
	var file_name = planeteDir.get_next()
	while file_name != "":
		if !file_name.ends_with(".import") and file_name != "." and file_name != "..":
			planeteTexture.append(ResourceLoader.load(path + file_name))
		file_name = planeteDir.get_next()
