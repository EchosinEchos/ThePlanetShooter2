extends Button

export(String) var texturePath:String

func _ready():
	$Icon.texture = load(texturePath)
	if texturePath == PlayerParameters.ballTexturePath:
		pressed = true
		$Tick.visible = true

func _on_Button_pressed():
	PlayerParameters.ballTexturePath = texturePath
	PlayerParameters.emit_signal("ballTextureChanged")


func _on_Button_toggled(button_pressed):
	$Tick.visible = pressed
