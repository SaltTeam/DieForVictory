extends Node2D

onready var global = get_node("/root/global")
var experience = 0

func actualize_experience():
	var earned = get_node("Panel/VBox/Earned")
	earned.set_bbcode("Expérience acquise: " + str(round(experience)) + " exp")

func actualize_life():
	get_node("Panel/VBox/HBox_life/text").set_bbcode("Life (" + str(global.life) + ") :")

func actualize_guard_capacity():
	get_node("Panel/VBox/HBox_guard_capacity/text1").set_bbcode("Guard cap (" + str(global.guard_capacity) + ") :")

func actualize_guard_time():
	get_node("Panel/VBox/HBox_guard_time/text2").set_bbcode("Guard cd (" + str(global.guard_time) + ") :")

func actualize_jab_damage():
	get_node("Panel/VBox/HBox_jab_damage/text3").set_bbcode("Jab dmg (" + str(global.jab_damage) + ") :")

func actualize_jab_time():
	get_node("Panel/VBox/HBox_jab_time/text4").set_bbcode("Jab time (" + str(global.jab_time) + ") :")

func actualize_kick_damage():
	get_node("Panel/VBox/HBox_kick_damage/text5").set_bbcode("Kick dmg (" + str(global.kick_damage) + ") :")

func actualize_kick_time():
	get_node("Panel/VBox/HBox_kick_time/text6").set_bbcode("Kick time (" + str(global.kick_time) + ") :")

func _ready():
	set_fixed_process(true)
	
	global.nb_looses = 9
	global.nb_wins = 3
	
	experience = global.experience + rand_range(global.nb_looses * -global.EXPERIENCE_PER_LOOSE, global.nb_wins * global.EXPERIENCE_PER_WIN)
	actualize_experience()
	get_node("Panel/VBox/Earned_message").set_bbcode("Waouh ! Descendance exceptionnelle !")
	
	# LIFE
	actualize_life()
	get_node("Panel/VBox/HBox_life/addtext").set_bbcode(str(global.LIFE_COST) + " exp")
	# GUARD CAPACITY
	actualize_guard_capacity()
	get_node("Panel/VBox/HBox_guard_capacity/addtext1").set_text(str(global.GUARD_CAPACITY_COST) + " exp")
	# GUARD TIME
	actualize_guard_time()
	get_node("Panel/VBox/HBox_guard_time/addtext2").set_text(str(global.GUARD_TIME_COST) + " exp")
	# JAB DAMAGE
	actualize_jab_damage()
	get_node("Panel/VBox/HBox_jab_damage/addtext3").set_text(str(global.JAB_DAMAGE_COST) + " exp")
	# JAB TIME
	actualize_jab_time()
	get_node("Panel/VBox/HBox_jab_time/addtext4").set_text(str(global.JAB_TIME_COST) + " exp")
	# KICK DAMAGE
	actualize_kick_damage()
	get_node("Panel/VBox/HBox_kick_damage/addtext5").set_text(str(global.KICK_DAMAGE_COST) + " exp")
	# KICK TIME
	actualize_kick_time()
	get_node("Panel/VBox/HBox_kick_time/addtext6").set_text(str(global.KICK_TIME_COST) + " exp")

func _fixed_process(delta):
	pass

func _on_add_pressed():
	if experience > global.LIFE_COST:
		global.life += 1
		experience -= global.LIFE_COST
		actualize_experience()
		actualize_life()

func _on_add1_pressed():
	if experience > global.GUARD_CAPACITY_COST:
		global.guard_capacity += 1
		experience -= global.GUARD_CAPACITY_COST
		actualize_experience()
		actualize_guard_capacity()

func _on_add2_pressed():
	if experience > global.GUARD_TIME_COST and global.guard_time > 0.1:
		global.guard_time -= 0.05
		experience -= global.GUARD_TIME_COST
		actualize_experience()
		actualize_guard_time()

func _on_add3_pressed():
	if experience > global.JAB_DAMAGE_COST:
		global.jab_damage += 1
		experience -= global.JAB_DAMAGE_COST
		actualize_experience()
		actualize_jab_damage()

func _on_add4_pressed():
	if experience > global.JAB_TIME_COST and global.jab_time > 0.11:
		global.jab_time -= 0.01
		experience -= global.JAB_TIME_COST
		actualize_experience()
		actualize_jab_time()

func _on_add5_pressed():
	if experience > global.KICK_DAMAGE_COST:
		global.kick_damage += 1
		experience -= global.KICK_DAMAGE_COST
		actualize_experience()
		actualize_kick_damage()

func _on_add6_pressed():
	if experience > global.KICK_TIME_COST and global.kick_time > 0.11:
		global.kick_time -= 0.01
		experience -= global.KICK_TIME_COST
		actualize_experience()
		actualize_kick_time()

func _on_valider_pressed():
	global.experience = experience
	print("validé!")
