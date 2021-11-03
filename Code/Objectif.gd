tool
extends gravity_attractor


func change_size():
	var cScale : Vector2 = Vector2.ONE *  (self.radius / 500.0)
	$Sprite.scale = cScale
	$CollisionShape2D.shape.set_radius(self.radius)


func _ready():
	add_to_group("goal")
	change_size()



func _process(_delta):
	if Engine.editor_hint:
		change_size()
