extends Node2D

class_name gravity_attractor

export(int) var radius:int = 100
export(int) var mass:int = 1000

func _ready():
	add_to_group("gravity_attractor")
