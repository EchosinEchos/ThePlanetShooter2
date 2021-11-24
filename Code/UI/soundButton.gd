extends Button

class_name soundButton

export(AudioStream) var audio:AudioStream

func _enter_tree():
	connect("pressed", self, "click")


func click():
	pass
