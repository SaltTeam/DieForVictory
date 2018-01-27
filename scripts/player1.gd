extends Sprite

onready var global = get_node("/root/global")
var pressButton  = false
var resetTime = 0
var timer = 0
var guard  = false
var dead = false

func _ready():
	global.init_global()
	set_process(true)

func _process(delta):
	if !dead:
		timer += delta
		if !pressButton:
			if Input.is_action_pressed("player1_guard") and global.guard_capacity > 0:
				guard = true
				set_texture(load("res://sprites/adon_guard.png"))
			if Input.is_action_pressed("player1_punch"):
				guard = false
				pressButton = true
				resetTime = global.jab_time
				timer = 0
				do_jab()
				set_texture(load("res://sprites/adon_jab.png"))
			if Input.is_action_pressed("player1_kick"):
				guard = false
				pressButton = true
				resetTime = global.kick_time
				timer = 0
				do_kick()
				set_texture(load("res://sprites/adon_kick.png"))
		if (timer > resetTime && guard == false):
			pressButton = false
			resetTime = 0
			timer = 0
			set_texture(load("res://sprites/adon_stand.png"))
	if dead or get_parent().get_node("enemy").dead:
		if Input.is_key_pressed(KEY_RETURN):
			get_tree().change_scene(global.next_level)

func do_jab():
	get_parent().get_node("enemy").take_damage(global.jab_damage)

func do_kick():
	get_parent().get_node("enemy").take_damage(global.kick_damage)

func take_damage(damage):
	if !guard:
		global.life -= damage
		if global.life <= 0:
			set_texture(load("res://sprites/adon_ko.png"))
			dead = true
			global.next_level = "res://scenes/test_export_var.tscn"
			global.nb_looses += 1
			global.end_level()
	else:
		global.guard_capacity -= damage
		if global.guard_capacity < 0:
			global.guard_capacity = 0
			guard = false
			set_texture(load("res://sprites/adon_stand.png"))
