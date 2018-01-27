extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var global = get_node("/root/global")
var life = 50
var jab_damage = 5
var resetTime = 0
var timer = 0
var punch = false
var dead = false

func _ready():
	set_process(true)

func _process(delta):
	if !dead and !get_parent().get_node("player").dead:
		timer += delta
		resetTime = global.jab_time
		if (timer > 1):
			do_jab()
			punch = true
			set_texture(load("res://sprites/joe_jab.png"))
			timer = 0
		if (timer > resetTime && punch == true):
			punch = false
			resetTime = 0
			timer = 0
			set_texture(load("res://sprites/joe_stand.png"))

func take_damage(damage):
	life -= damage
	if life <= 0:
		dead = true
		set_texture(load("res://sprites/joe_ko.png"))
		global.next_level = "res://scenes/Stage2.tscn"
		global.nb_wins += 1
		global.experience += 10
		global.end_level()

func do_jab():
	get_parent().get_node("player").take_damage(jab_damage)
