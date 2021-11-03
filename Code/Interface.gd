extends Control


func _ready():
	SceneParameters.connect("s", self, "bb")

func bb():
	print("okoi,")
