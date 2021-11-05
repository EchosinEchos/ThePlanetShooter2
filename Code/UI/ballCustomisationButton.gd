extends Button

export(String) var texturePath:String

func _ready():
	$Icon.texture = load(texturePath)

func _on_Button_pressed():
	PlayerParameters.ballTexturePath = texturePath
	PlayerParameters.emit_signal("ballTextureChanged")
