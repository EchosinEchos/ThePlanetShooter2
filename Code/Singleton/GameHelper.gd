extends Node

signal win
signal nextLevel
signal close

signal play


var score:int = 0
var nb_ball_launched:int = 0

var menuScene:PackedScene = preload("res://Scene/Menu.tscn")


func _ready():
	self.connect("close", self, "close")

func win():
	emit_signal("win")
	
	if GameHelper.score > PlayerParameters.highScore:
		PlayerParameters.highScore = GameHelper.score
		PlayerParameters.saveVar()
	
func nextLevel():
	nb_ball_launched = 0
	emit_signal("nextLevel")


func play():
	emit_signal("play")
	
func close():
	get_tree().change_scene_to(menuScene)
