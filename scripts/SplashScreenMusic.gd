extends SamplePlayer

func _ready():
	var sample = get_node("music").get_sample_library().get_sample("OOaih")
	#play("OOaih")
	sample.set_loop_format(sample.LOOP_FORWARD)
    sample.set_loop_begin(0)