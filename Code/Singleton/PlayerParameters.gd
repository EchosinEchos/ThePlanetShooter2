extends Node

signal ballTextureChanged

var ballTexturePath:String
var ball_texture:Texture = preload("res://Image/Ball/Asteroid.png")

var maxStage:int = 0

func _ready():
	var arr = Util.loadTexture("res://Image/Ball/", ["svg"])
	ball_texture = arr[1]
	connect("ballTextureChanged", self, "ballTextureChanged")
	
func ballTextureChanged():
	ball_texture = load(ballTexturePath)
