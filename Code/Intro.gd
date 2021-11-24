extends Control

onready var tween:Tween = $"tutoRoot/Tween"

var menuScene:PackedScene = load("res://Scene/Menu.tscn")

func _ready():
	GameHelper.connect("win", self, "finish")
	$"tutoRoot/1".visible = true
	tween.interpolate_property($"tutoRoot/1/Label","percent_visible", 0, 1, 4 )
	tween.start()


func finish():
	$"tutoRoot".visible=true
	$"tutoRoot/3".visible = true
	tween.interpolate_property($"tutoRoot/3/Label","percent_visible", 0, 1, 4 )
	tween.start()


func _on_1_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			$"tutoRoot/1".visible = false
			$"tutoRoot/2".visible = true
			tween.interpolate_property($"tutoRoot/2/Label","percent_visible", 0, 1, 4 )
			tween.start()
			$"tutoRoot/AnimationPlayer".play("DragnDrop")



func _on_2_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			$"tutoRoot/2".visible=false
			$"tutoRoot".visible = false



func _on_3_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			PlayerParameters.newPlayer = false
			PlayerParameters.saveVar()
			get_tree().change_scene_to(menuScene)
