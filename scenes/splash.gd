extends TextureFrame

func _ready():
	pass

func _on_AnimationPlayer_finished():
	get_tree().change_scene("res://scenes//Panel.tscn")
