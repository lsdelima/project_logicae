extends Area2D

var play

func _physics_process(_delta):
	play = false
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "player": 
			play = true
