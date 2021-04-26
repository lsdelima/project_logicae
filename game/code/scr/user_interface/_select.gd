extends Control

var valor

func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST:
		_on_Back_pressed()
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		_on_Back_pressed()

func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://scr/user_interface/main_menu.tscn")

func _on_retornar_pressed():
	get_tree().change_scene("res://scr/user_interface/main_menu.tscn")

func _on_jogar_pressed():
	valor = $HBoxContainer/SpinBox.value
	get_tree().change_scene("res://scr/worlds/world_" + str(int(valor)) + ".tscn")

func _on_Back_pressed():
	get_tree().change_scene("res://scr/user_interface/main_menu.tscn")
