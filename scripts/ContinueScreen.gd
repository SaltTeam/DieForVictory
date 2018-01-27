extends Label

onready var global = get_node("/root/global")

func _ready():
	set_process(true)

func _process(delta):
	if Input.is_key_pressed(KEY_ENTER):
		get_tree().change_scene(global.next_level)
