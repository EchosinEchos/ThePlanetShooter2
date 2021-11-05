extends Node

signal sizeChanged
signal stageChanged

var endSize:int = 100 setget change_end_size
var startSize:int = 300 setget change_start_size

var stage:int = 0 setget stageChanged

enum LevelTypeEnum {Infinity, OpenLevel, StoryLevel}
export(LevelTypeEnum) var Level_Type


func change_start_size(size):
	startSize = size
	emit_signal("sizeChanged")
	
func change_end_size(size):
	endSize = size
	emit_signal("sizeChanged")
	
func stageChanged(chg):
	stage = chg
	emit_signal("stageChanged")
	
