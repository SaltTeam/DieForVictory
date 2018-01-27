extends Button

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	pass

func _input_event(ev):
	if (ev.type==InputEvent.MOUSE_BUTTON and ev.pressed):
		#call another scope or the game scope