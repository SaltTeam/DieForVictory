extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var global = get_node("/root/global")
var life
var jabDamages
var kickDamages
var resetTime = 0
var timer = 0
var punch = false

func _ready():
	set_process(true)

func _process(delta):
	timer += delta
	resetTime = global.jab_time
	print("this -> ", timer)
	print(delta)
	if (timer > 1):
		punch = true
		set_texture(load("res://sprites/joe_jab.png"))
		timer = 0
	if (timer > resetTime && punch == true):
		punch = false
		resetTime = 0
		timer = 0
		set_texture(load("res://sprites/joe_stand.png"))
	
func take_damages(damages):
	pass
