extends Sprite

enum HIT{
  JAB,
  HIGHKICK,
  GUARD
}

onready var global = get_node("/root/global")
var life= 500
var jab_damage = 100
var kick_damage = 180
var resetTime = 0
var timer = 0
var dead = false

var rand = 0
var pattern = [[JAB,HIGHKICK,GUARD,HIGHKICK], [GUARD,GUARD,GUARD,JAB]]
var patternValue = 3

func _ready():
	set_process(true)

func _process(delta):
	if !dead and !get_parent().get_node("player").dead:
		timer += delta
		if (timer > 1):
			if (patternValue == 4):
				rand = round(rand_range(0, 1))
				patternValue = 0
			if (pattern[rand][patternValue] == JAB):
				do_jab()
				resetTime = global.BASE_JAB_TIME
				set_texture(load("res://sprites/lee_jab.png"))
			elif (pattern[rand][patternValue] == HIGHKICK):
				do_kick()
				resetTime = global.BASE_KICK_TIME
				set_texture(load("res://sprites/lee_kick.png"))
			else:
				resetTime = global.BASE_GUARD_TIME
				set_texture(load("res://sprites/lee_guard.png"))
			timer = 0
			patternValue += 1
		if (timer > resetTime):
			set_texture(load("res://sprites/lee_stand.png"))

func take_damage(damage):
	life -= damage
	if life <= 0:
		dead = true
		set_texture(load("res://sprites/lee_ko.png"))
		global.next_level = "res://scenes/Stage3.tscn"
		global.experience += 30
		global.nb_wins += 1
		global.end_level()

func do_jab():
	get_parent().get_node("player").take_damage(jab_damage)

func do_kick():
	get_parent().get_node("player").take_damage(kick_damage)
