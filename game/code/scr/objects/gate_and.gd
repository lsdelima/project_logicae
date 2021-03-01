extends RigidBody2D

var picked = false


func _physics_process(_delta):
	if picked == true:
		self.position = get_node("../player/Camera2D/Position2D").global_position
		sleeping = true
	else:
		sleeping = false
		

func _input(_event):
	if Input.is_action_just_pressed("e"):
		var bodies = $detector.get_overlapping_bodies()
		for body in bodies:
			if body.name == "player" and picked == false:
				picked = true
	if Input.is_action_just_pressed("r") and picked == true:
		picked = false
		get_node("../player").can_pick = true
