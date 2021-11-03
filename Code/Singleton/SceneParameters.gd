extends Node

signal sizeChanged

export(int) var endSize:int = 100 setget change_end_size
export(int) var startSize:int = 300 setget change_start_size

func change_start_size(size):
	startSize = size
	emit_signal("sizeChanged")
	
func change_end_size(size):
	endSize = size
	emit_signal("sizeChanged")
