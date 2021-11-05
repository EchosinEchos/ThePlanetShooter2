extends Control

var gameScene:PackedScene = preload("res://Scene/Monde.tscn")
var ballButton:PackedScene = preload("res://otherRes/UI/Scene/ballCustomisationButton.tscn")

var listOfTexture:Array

func _ready():
	$AnimationPlayer.play("Menu Animation")
	listOfTexture = Util.listTexture("res://Image/Ball/", ["svg"])
	


func _on_infinityButton_pressed():
	SceneParameters.Level_Type = SceneParameters.LevelTypeEnum.Infinity
	$AnimationPlayer.play_backwards("Menu Animation")
	yield($AnimationPlayer, "animation_finished")
	get_tree().change_scene_to(gameScene)
	GameHelper.call_deferred("play")


func _on_customButton_pressed():
	for tex in listOfTexture:
		var n_node = ballButton.instance()
		n_node.texturePath = tex
		$CustomisationContainer/MarginContainer/VBoxContainer/Panel/ScrollContainer/GridContainer.add_child(n_node)
	$CustomisationContainer.visible = true


func _on_okButton_pressed():
	$CustomisationContainer.visible= false
