extends Control

var gameScene:PackedScene = preload("res://Scene/Monde.tscn")
var ballButton:PackedScene = preload("res://otherRes/UI/Scene/ballCustomisationButton.tscn")

var listOfTexture:Array

func _ready():
	PlayerParameters.connect("ballTextureChanged",self, "ballTextureChanged")
	
	if !OS.is_debug_build():
		$AnimationPlayer.play("Menu Animation")
	listOfTexture = Util.listTexture("res://Image/Ball/", ["svg"])
	addButton_to_Grid()
	
	$"Bacground/Astéroid".texture = PlayerParameters.ball_texture
	


func _on_infinityButton_pressed():
	SceneParameters.Level_Type = SceneParameters.LevelTypeEnum.Infinity
	
	if !OS.is_debug_build():
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

func addStats(name, value):
	var nameLabel:Label = Label.new()
	var valueLabel:Label = Label.new()
	var sep:HSeparator = HSeparator.new()
	nameLabel.text = name
	valueLabel.text =String(value)
	valueLabel.add_color_override("font_color", Color.gray)
	valueLabel.align = Label.ALIGN_RIGHT
	sep.margin_bottom = 100
	$StatsContainer/MarginContainer/VBoxContainer/Panel/ScrollContainer/VBoxContainer.add_child(nameLabel)
	$StatsContainer/MarginContainer/VBoxContainer/Panel/ScrollContainer/VBoxContainer.add_child(valueLabel)
	$StatsContainer/MarginContainer/VBoxContainer/Panel/ScrollContainer/VBoxContainer.add_child(sep)

func _on_statisticButton_pressed():
	addStats("High Score", PlayerParameters.highScore)
	addStats("Max Stage", PlayerParameters.maxStage)
	$StatsContainer.visible = true


func _on_okStatsButton_pressed():
	for c in $StatsContainer/MarginContainer/VBoxContainer/Panel/ScrollContainer/VBoxContainer.get_children():
		$StatsContainer/MarginContainer/VBoxContainer/Panel/ScrollContainer/VBoxContainer.remove_child(c)
		c.queue_free()
	
	$StatsContainer.visible=false
	
	
func ballTextureChanged():
	$"Bacground/Astéroid".texture = PlayerParameters.ball_texture
