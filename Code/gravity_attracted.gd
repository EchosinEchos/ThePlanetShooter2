extends KinematicBody2D

class_name gravity_attracted

const G = 22000

var force:Vector2 = Vector2.ZERO
var grav_target : Array

export(int) var mass : int = 100

func _ready():
	add_to_group("gravity_attracted")
	grav_target = get_tree().get_nodes_in_group("gravity_attractor")
	

func _physics_process(_delta):
	force = Vector2.ZERO
	for p in grav_target:
#		print(p.mass)
#		print(p.get_global_position())
		var curVec : Vector2 = p.get_global_position() - self.get_global_position()
		var dist : float = curVec.length()
		force += (p.mass * G)/pow(dist, 3) * curVec
