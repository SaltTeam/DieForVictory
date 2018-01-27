extends Label

onready var global = get_node("/root/global")

func _on_Enter_pressed():
	get_tree().change_scene(global.next_level)