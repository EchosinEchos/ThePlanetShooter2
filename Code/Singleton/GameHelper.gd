extends Node

signal win
signal nextLevel


var score:int = 0
var nb_ball_launched:int = 0


func win():
	emit_signal("win")
	
func nextLevel():
	nb_ball_launched = 0
	emit_signal("nextLevel")
