extends pedestal_three 

export (NodePath) var previous

func _process(_delta):
	input_2 = get_node(previous).output
	busy = get_node(previous).busy_real
