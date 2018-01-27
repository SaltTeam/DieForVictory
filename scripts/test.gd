extends Sprite

onready var kick_img = load("res://textures/adon_kick.tex")

func _ready():
	set_process_input(true)

func _input(event):
	if Input.is_key_pressed(KEY_A):
		set_texture(kick_img)
