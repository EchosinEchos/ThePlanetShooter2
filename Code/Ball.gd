extends gravity_attracted

var a:Vector2 = Vector2.ZERO
var v:Vector2 = Vector2.ZERO
var dpl:Vector2 = Vector2.ZERO

var root:Node

func _ready():
	root = get_tree().get_root()
	$Sprite.texture = PlayerParameters.ball_texture
	
func _physics_process(delta):
	
	a = force
	v += a * delta
	dpl += v*delta
	
	$Sprite.rotation = atan2(v.x, -v.y)
	
	var col : KinematicCollision2D = move_and_collide(dpl)
	if col != null:
		var gr = col.collider.get_groups()
		
		if "goal" in gr:
			print("win")
			queue_free()
			root.get_node("Monde/LevelHelper").win_lvl()
			
		elif "planete" in gr:
			#queue_free()
			supress()
			



func supress():
	self.set_physics_process(false)
	$Sprite.visible = false
	$Fire.emitting = false
	$Timer.start()
