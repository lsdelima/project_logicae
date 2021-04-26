extends Control

var timer

func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST:
		_on_Back_pressed()
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		_on_Back_pressed()

func ready():
	get_tree().set_quit_on_go_back(false)
	timer = get_node("Timer")
	timer.start()

#func _process(_delta):
#	if Input.is_action_just_pressed("ui_cancel"):
#		get_tree().quit()

func _on_jogar_pressed():
	get_tree().change_scene("res://scr/worlds/world_1.tscn")


func _on_creditos_pressed():
	get_tree().change_scene("res://scr/user_interface/credits.tscn")


func _on_selecionar_level_pressed():
	get_tree().change_scene("res://scr/user_interface/select.tscn")

func _on_Back_pressed():
	get_tree().quit()
