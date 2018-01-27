extends Sprite

enum HIT{
  JAB,
  HIGHKICK,
  GUARD
}

onready var global = get_node("/root/global")
var life= 50
var jabDamages = 10
var kickDamages = 15
var resetTime = 0
var timer = 0

var pattern = [JAB,JAB,HIGHKICK,GUARD]
var patternValue = 0

func _ready():
	set_process(true)

func _process(delta):
	timer += delta
	if (timer > 1):
		if (pattern[patternValue] == JAB):
			resetTime = global.BASE_JAB_TIME
			set_texture(load("res://sprites/retsu_jab.png"))
		elif (pattern[patternValue] == HIGHKICK):
			resetTime = global.BASE_KICK_TIME
			set_texture(load("res://sprites/retsu_kick.png"))
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
		
func take_damages(damages):
	pass