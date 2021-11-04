tool
extends Control


func _ready():
	sizeChanged()
	SceneParameters.connect("sizeChanged", self, "sizeChanged")
	SceneParameters.connect("stageChanged", self, "stageChanged")
	

func  sizeChanged():
	$StageContainer.margin_top = -(SceneParameters.endSize + SceneParameters.startSize)
	$StageContainer.margin_bottom = -(SceneParameters.endSize)
	pass
	
func stageChanged():
	$StageContainer/Number.text = String(SceneParameters.stage)
	pass
