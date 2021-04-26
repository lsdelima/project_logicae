extends Node2D
class_name pedestal_three 

var can_dock 

var gates_and
var gates_or
var gates_not
var gates_nand
var gates_nor
var gates_xor
var gates_xnor

export var input = true
export var input_2 = true
var output

var busy = true
var busy_real

func _process(_delta):
	$sprite_alert.visible = false
	output = false
	busy_real = false

	gates_and = get_tree().get_nodes_in_group("gates_and")
	for child in gates_and:
		if $Area2D.overlaps_body(child) and busy == true:
			busy_real = true
			if input and input_2:
				output = true

	gates_or = get_tree().get_nodes_in_group("gates_or")
	for child in gates_or:
		if $Area2D.overlaps_body(child) and busy == true:
			busy_real = true
			if input or input_2:
				output = true

	gates_not = get_tree().get_nodes_in_group("gates_not")
	for child in gates_not:
		if $Area2D.overlaps_body(child):
			$sprite_alert.visible = true

	gates_nand = get_tree().get_nodes_in_group("gates_nand")
	for child in gates_nand:
		if $Area2D.overlaps_body(child) and busy == true:
			busy_real = true
			if !(input and input_2):
				output = true

	gates_nor = get_tree().get_nodes_in_group("gates_nor")
	for child in gates_nor:
		if $Area2D.overlaps_body(child) and busy == true:
			busy_real = true
			if !(input or input_2):
				output = true

	gates_xor = get_tree().get_nodes_in_group("gates_xor")
	for child in gates_xor:
		if $Area2D.overlaps_body(child) and busy == true:
			busy_real = true
			if input != input_2:
				output = true

	gates_xnor = get_tree().get_nodes_in_group("gates_xnor")
	for child in gates_xnor:
		if $Area2D.overlaps_body(child) and busy == true:
			busy_real = true
			if !(input != input_2):
				output = true

	get_animation()

func get_animation():
	if input == true:
		$sprite_input_a.frame = 3
	else:
		$sprite_input_a.frame = 5
	
	if input_2 == true:
		$sprite_input_b.frame = 2
	else:
		$sprite_input_b.frame = 5
	
	if output == true:
		$sprite_output.frame = 4
	else:
		$sprite_output.frame = 5
