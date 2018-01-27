extends Node

export var experience = 0
export var next_level = ""

const EXPERIENCE_PER_WIN = 10
export var nb_wins = 0
const EXPERIENCE_PER_LOOSE = 5
export var nb_looses = 0

# LIFE
const LIFE_COST = 5
const BASE_LIFE = 25
export var life = 0
export var max_life = BASE_LIFE

# GUARD
const GUARD_CAPACITY_COST = 5
const BASE_GUARD_CAPACITY = 50
export var guard_capacity = 0
export var max_guard_capacity = BASE_GUARD_CAPACITY

const GUARD_TIME_COST = 10
const BASE_GUARD_TIME = 2
export var guard_time = BASE_GUARD_TIME

# JAB
const JAB_DAMAGE_COST = 10
const BASE_JAB_DAMAGE = 15
export var jab_damage = BASE_JAB_DAMAGE

const JAB_TIME_COST = 15
const BASE_JAB_TIME = 0.3
export var jab_time = BASE_JAB_TIME

# KICK
const KICK_DAMAGE_COST = 10
const BASE_KICK_DAMAGE = 20
export var kick_damage = BASE_KICK_DAMAGE

const KICK_TIME_COST = 15
const BASE_KICK_TIME = 0.4
export var kick_time = BASE_KICK_TIME

func init_global():
	life = max_life
	guard_capacity = max_guard_capacity

func end_level():
	var scene = load("res://scenes/ContinueScreen.tscn")
	var node = scene.instance()
	get_tree().get_root().add_child(load("res://scenes/ContinueScreen.tscn").instance())
