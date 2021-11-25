extends Node

onready var UIsnd:AudioStreamPlayer = $"UIsnd"
onready var GameEffect:AudioStreamPlayer = $"GameEffect"


var dictEffectSound:Dictionary


func _ready():
	dictEffectSound = Util.dictRessource("res://Sound/Effect/")
	
	
func play_click():
	UIsnd.stream = dictEffectSound["click"]
	UIsnd.play()


func play_boom():
	GameEffect.stream = dictEffectSound["boom"]
	GameEffect.play()
