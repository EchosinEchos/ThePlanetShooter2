extends Button

class_name soundButton

export(AudioStream) var audio:AudioStream

func _enter_tree():
	connect("pressed", self, "click")
	connect("toggled", self, "click")


func click():
	SoundManager.play_click()
