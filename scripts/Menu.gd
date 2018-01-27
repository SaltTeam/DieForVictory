extends Panel

func _ready():
	pass


func _on_HistoireButton_pressed():
	get_tree().change_scene("res://scenes//fight.tscn")

func _on_VersusButton_pressed():
	get_tree().quit()
