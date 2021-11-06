extends Control

var gameScene:PackedScene = preload("res://Scene/Monde.tscn")
var ballButton:PackedScene = preload("res://otherRes/UI/Scene/ballCustomisationButton.tscn")

var listOfTexture:Array

func _ready():
	if !OS.is_debug_build():
		$AnimationPlayer.play("Menu Animation")
	listOfTexture = Util.listTexture("res://Image/Ball/", ["svg"])
	addButton_to_Grid()
	


func _on_infinityButton_pressed():
	SceneParameters.Level_Type = SceneParameters.LevelTypeEnum.Infinity
	$AnimationPlayer.play_backwards("Menu Animation")
	yield($AnimationPlayer, "animation_finished")
	get_tree().change_scene_to(gameScene)
	GameHelper.call_deferred("play")


func addButton_to_Grid():
	for tex in listOfTexture:
		var n_node:Button = ballButton.instance()
		n_node.texturePath = tex
		n_node.group = preload("res://otherRes/UI/Scene/ballCustomisationGroupButton.tres")
		$CustomisationContainer/MarginContainer/VBoxContainer/Panel/ScrollContainer/GridContainer.add_child(n_node)

func _on_customButton_pressed():
	$CustomisationContainer.visible = true


func _on_okButton_pressed():
	PlayerParameters.saveVar()
	$CustomisationContainer.visible= false
