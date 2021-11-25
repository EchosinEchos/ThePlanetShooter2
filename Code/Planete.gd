tool
extends gravity_attractor

func change_size():
	var cScale : Vector2 = Vector2.ONE *  (self.radius / 500.0)
	$Sprite.scale = cScale
	$CollisionShape2D.shape.set_radius(self.radius)

func _ready():
	add_to_group("planete")
	$CollisionShape2D.shape = CircleShape2D.new()
	change_size()
	
	if $Sprite.texture == null:
		var planeteTexture:Array = Util.loadRessource("res://Image/Planete/")
		$Sprite.texture = planeteTexture[randi()%planeteTexture.size()]



func _process(_delta):
	if Engine.editor_hint:
		change_size()
