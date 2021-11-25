extends Node

signal ballTextureChanged


const paramFilePath:String = "user://parameters.dat"
var paramFile:File = File.new()

var ballTexturePath:String = "res://Image/Ball/Asteroid.png"
var ball_texture:Texture

var maxStage:int =  0
var highScore:int = 0

var newPlayer:bool = true

func _ready():
	var arr = Util.loadRessource("res://Image/Ball/", ["svg"])
	ball_texture = arr[1]
	
	readVar()
	
	connect("ballTextureChanged", self, "ballTextureChanged")
	
	
func ballTextureChanged():
	ball_texture = load(ballTexturePath)
	
	
func readVar():
	
	if paramFile.file_exists(paramFilePath):
		var saveDict:Dictionary
		paramFile.open(paramFilePath, File.READ)
		saveDict = parse_json(paramFile.get_as_text())
		paramFile.close()
			
		if saveDict.has("ballTexturePath"):
			ballTexturePath = saveDict.get("ballTexturePath")
		if saveDict.has("highScore"):
			highScore = saveDict.get("highScore")
		if saveDict.has("maxStage"):
			maxStage = saveDict.get("maxStage")
		if saveDict.has("newPlayer"):
			newPlayer = saveDict.get("newPlayer")
			
			

	ball_texture = load(ballTexturePath)
	
	
func saveVar():
	paramFile.open(paramFilePath, File.WRITE)
	
	var saveDic:Dictionary = {
		"ballTexturePath" : ballTexturePath,
		"highScore" : highScore,
		"maxStage" : maxStage,
		"newPlayer" : newPlayer,
	}
	
	paramFile.store_line(to_json(saveDic))
	paramFile.close()
