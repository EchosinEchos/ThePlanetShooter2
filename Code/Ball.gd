extends gravity_attracted

var a:Vector2 = Vector2.ZERO
var v:Vector2 = Vector2.ZERO
var dpl:Vector2 = Vector2.ZERO

var planete:Array

var score: int = 0

func _ready():
	$Sprite.texture = PlayerParameters.ball_texture
	planete = get_tree().get_nodes_in_group("gravity_attractor")
	
	
func _physics_process(delta):
	
	a = force
	v += a * delta
	dpl += v*delta
	
	$Sprite.rotation = atan2(v.x, -v.y)
	
	var col : KinematicCollision2D = move_and_collide(dpl)
	if col != null:
		var gr = col.collider.get_groups()
		
		if "goal" in gr:
			queue_free()
			GameHelper.score = score/sqrt(GameHelper.nb_ball_launched)
			GameHelper.win()
			
			
		elif "planete" in gr:
			#queue_free()
			suppress()
	
	for p in planete:
		score += v.length()/(2*log(position.distance_to(p.position))*sqrt(planete.size()))


func suppress():
	self.set_physics_process(false)
	$Sprite.visible = false
	$Fire.emitting = false
	$Timer.start()
