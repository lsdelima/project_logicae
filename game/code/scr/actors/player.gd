class_name player
extends actor

const UP = Vector2(0,-1)
const ACCELERATION = 30
var can_pick = true
onready var animation_player = $animation

func _physics_process(_delta):
	_velocity.y += gravity * _delta
	var friction = false
	
	if Input.is_action_pressed("ui_right"):
		_velocity.x = min(_velocity.x + ACCELERATION, speed.x)
		anim_switch("run")
		$sprite.flip_h = false
		
	elif Input.is_action_pressed("ui_left"):
		_velocity.x = max(_velocity.x - ACCELERATION, -speed.x)
		anim_switch("run")
		$sprite.flip_h = true
		
	else:
		anim_switch("idle")
		friction = true
	
	if is_on_floor(): 
		if Input.is_action_just_pressed("ui_up"):
			_velocity.y = -speed.y
			$jump.play()
		if friction == true:
			_velocity.x = lerp(_velocity.x , 0, 0.2)
	else: 
		if _velocity.y > 0:
			anim_switch("fall")
		else:
			anim_switch("jump")
		if friction == true:
			_velocity.x = lerp(_velocity.x , 0, 0.6)
			
	_velocity = move_and_slide(_velocity, UP)


func anim_switch(animation):
	var new_anim = str(animation)
	if animation_player.current_animation != new_anim:
		animation_player.play(new_anim)


