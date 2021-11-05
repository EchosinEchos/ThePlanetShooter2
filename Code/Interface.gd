tool
extends Control


func _ready():
	sizeChanged()
	SceneParameters.connect("sizeChanged", self, "sizeChanged")
	SceneParameters.connect("stageChanged", self, "stageChanged")
	
	
	GameHelper.connect("win", self, "win")
	

func  sizeChanged():
	$MarginContainer.margin_top = -(SceneParameters.endSize + SceneParameters.startSize)
	$MarginContainer.margin_bottom = -(SceneParameters.endSize)
	pass
	
func stageChanged():
	$MarginContainer/StageContainer/Number.text = String(SceneParameters.stage)
	pass


func win():
	$TopLayer/ResumeContainer.visible = true
	$TopLayer/ClickBlocker.visible = true
	$TopLayer/ResumeContainer/MarginContainer/VBoxContainer/ScoreLabel.text = String(GameHelper.score)
	get_tree().paused = true

func _on_next_Button_pressed():
	$TopLayer/ResumeContainer.visible = false
	$TopLayer/ClickBlocker.visible = false
	get_tree().paused = false
	GameHelper.nextLevel()


func _on_skipButton_pressed():
	GameHelper.emit_signal("nextLevel")


func _on_closeButton_pressed():
	GameHelper.emit_signal("close")
