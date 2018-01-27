extends Sprite

var pressButton  = false
var resetTime = 0
var timer = 0
var guard  = false

func _process(delta):
	timer += delta
	if pressButton == false:
		if Input.is_key_pressed(KEY_A):
			guard = true
			set_texture(load("res://sprites/adon_guard.png"))
		if Input.is_key_pressed(KEY_Z):
			guard = false
			pressButton = true
			resetTime = 0.2
			timer = 0
			set_texture(load("res://sprites/adon_jab.png"))
		if Input.is_key_pressed(KEY_E):
			guard = false
			pressButton = true
			resetTime = 0.4
			timer = 0
			set_texture(load("res://sprites/adon_kick.png"))
	if (timer > resetTime && guard == false):
		pressButton = false
		resetTime = 0
		timer = 0
		set_texture(load("res://sprites/adon_stand.png"))


func _ready():
	set_process(true)
