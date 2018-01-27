extends Label

onready var global = get_node("/root/global")


func _ready():
	set_text("Press enter to continue")
	set_process(true)
	

func _process(delta):
	if 
	#get_tree().change_scene(g)