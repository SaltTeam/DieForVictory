extends Sprite

enum HIT{
  JAB,
  HIGHKICK,
  GUARD
}

onready var global = get_node("/root/global")
var life= 2000
var jabDamages = 600
var kickDamages = 850
var resetTime = 0
var timer = 0

var rand = 0
var pattern = [[JAB,HIGHKICK,GUARD], [GUARD,GUARD,GUARD], [HIGHKICK,JAB,HIGHKICK], [GUARD,HIGHKICK,GUARD], [JAB,GUARD,JAB]]
var patternValue = 2

func _ready():
	set_process(true)

func _process(delta):
	timer += delta
	if (timer > 1):
		if (patternValue == 2):
			rand = round(rand_range(0, 4))
			patternValue = 0
		if (pattern[rand][patternValue] == JAB):
			resetTime = global.BASE_JAB_TIME
			set_texture(load("res://sprites/sagat_jab.png"))
		elif (pattern[rand][patternValue] == HIGHKICK):
			resetTime = global.BASE_KICK_TIME
			set_texture(load("res://sprites/sagat_kick.png"))
		else:
			resetTime = global.BASE_GUARD_TIME
			set_texture(load("res://sprites/sagat_guard.png"))
		timer = 0
		patternValue += 1
	if (timer > resetTime):
		set_texture(load("res://sprites/sagat_stand.png"))

func take_damages(damages):
	pass
