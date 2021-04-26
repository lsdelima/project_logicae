class_name gate
extends RigidBody2D

var picked = false
var pedestal_dock
var pedestal_nodes
var gates 
var detector 
var droped 
var button

onready var animation_player = $animation

func _ready():
	gates = get_tree().get_nodes_in_group("gate")
	pedestal_nodes = get_tree().get_nodes_in_group("pedestal")
	pedestal_dock = pedestal_nodes[0].get_node("Position2D").global_position

func _physics_process(_delta): 
		if picked == true:
			$sprite_iron.visible = true
			self.position = lerp(global_position,get_node("../player/Camera2D/Position2D").global_position,15 * _delta)
			self.rotation = lerp_angle(self.rotation, 0, 15 * _delta)
			anim_switch("select")
			sleeping = true
			droped = false
			button = false
			
		elif droped == true : 
			self.position = lerp(global_position, pedestal_dock, 15 * _delta)
			self.rotation = lerp_angle(self.rotation, 0, 15 * _delta)
			$sprite_iron.visible = false
			sleeping = false
			button = true

		else:
			$sprite_iron.visible = false
			sleeping = false
			droped = false
			button = true


func _input(_event):

	var bodies = $detector.get_overlapping_bodies()

	if Input.is_action_just_pressed("ui_action") and button == true:
		for body in bodies:
			if body.name == "player" and get_node("../player").can_pick  == true:
				picked = true
				get_node("../player").can_pick  = false
				$select.play()

	if Input.is_action_just_pressed("ui_action") and picked == true and button == false:
		$drop.play()
		picked = false
		get_node("../player").can_pick = true
		button = true
		

	for child in pedestal_nodes:
		var shortest_dist = 30
		var distance = global_position.distance_to(child.get_node("Position2D").global_position)
		if distance < shortest_dist:
			pedestal_dock = child.get_node("Position2D").global_position
			detector = child.get_node("detector").get_overlapping_bodies()
			for objects in detector: 
				for _gate in gates:
					if child.can_dock == true:
						droped = true
						child.can_dock  = false

		else:
			child.can_dock  = true

func anim_switch(animation):
	var new_anim = str(animation)
	if animation_player.current_animation != new_anim:
		animation_player.play(new_anim)
