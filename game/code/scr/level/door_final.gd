extends Area2D

export (NodePath) var previous

onready var time = $"Timer"


var input

func _physics_process(_delta):
	input = get_node(previous).output

	if input == true:
		$Sprite.frame = 1
		$CollisionShape2D.disabled = false
	else:
		$Sprite.frame = 0
		$CollisionShape2D.disabled = true

func _on_door_body_entered(body) -> void:
	if body.name == "player":
		time.start()
		$music_loop_player.stream_paused = true
		$music_level.playing = true

func _on_Timer_timeout():
	get_tree().change_scene("res://scr/user_interface/level_game_complete.tscn")
