extends Node

signal win
signal nextLevel


var score:int = 0


func win():
	emit_signal("win")
	
func nextLevel():
	emit_signal("nextLevel")
