extends Control

func _on_Timer_timeout():
	get_tree().change_scene("res://scr/user_interface/credits.tscn")
