extends TileMap


export (NodePath) var previous

var input

func _physics_process(_delta):
	input = get_node(previous).output

	if input == true:
		visible = true
	else:
		visible = false

