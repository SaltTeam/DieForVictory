extends Sprite

enum HIT{
  JAB,
  HIGHKICK,
  GUARD
}

onready var global = get_node("/root/global")
var life= 50
var jab_damage = 10
var kick_damage = 15
var resetTime = 0
var timer = 0
var dead = false

var pattern = [JAB,JAB,HIGHKICK,GUARD]
var patternValue = 0

func _ready():
	set_process(true)

func _process(delta):
	if !dead and !get_parent().get_node("player").dead:
		timer += delta
		if (timer > 1):
			if (pattern[patternValue] == JAB):
				resetTime = global.BASE_JAB_TIME
				set_texture(load("res://sprites/retsu_jab.png"))
				do_jab()
			elif (pattern[patternValue] == HIGHKICK):
				resetTime = global.BASE_KICK_TIME
				set_texture(load("res://sprites/retsu_kick.png"))
				do_kick()
			else:
				resetTime = global.BASE_GUARD_TIME
				set_texture(load("res://sprites/retsu_guard.png"))
			timer = 0
		if (timer > resetTime):
			set_texture(load("res://sprites/retsu_stand.png"))
			 
		if (patternValue == 3):
			patternValue = 0
		else:
			patternValue += 1

func take_damage(damage):
	life -= damage
	if life <= 0:
		dead = true
		set_texture(load("res://sprites/retsu_ko.png"))
		global.next_level = "res://scenes/Stage3.tscn"
		global.experience += 20
		global.nb_wins += 1
		global.end_level()

func do_jab():
	get_parent().get_node("player").take_damage(jab_damage)

func do_kick():
	get_parent().get_node("player").take_damage(kick_damage)
