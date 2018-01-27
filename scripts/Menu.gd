extends Panel

func _ready():
	pass


func _on_HistoireButton_pressed():
	var scene = load("res://scenes//splash.tscn")
	var node = scene.instance()
	add_child(node)
	pass

func _on_VersusButton_pressed():
	var scene = load("res://scenes//splash.tscn")
	var node = scene.instance()
	add_child(node)
	pass
