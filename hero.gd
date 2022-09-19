extends KinematicBody

export var speed = 10
export var fall_acceleration = 75
var velocity = Vector3.ZERO
export var jump_impulse = 20

onready var _animated_sprite = $AnimatedSprite3D

func _physics_process(delta):
	var direction = Vector3.ZERO

	if Input.is_action_pressed("ui_right"):
		_animated_sprite.flip_h = true
		_animated_sprite.play("walk_down")
		direction.x += 1
	elif Input.is_action_just_released("ui_right"):
		_animated_sprite.play("still_down")
	elif Input.is_action_pressed("ui_left"):
		_animated_sprite.flip_h = true
		_animated_sprite.play("walk_up")
		direction.x -= 1
	elif Input.is_action_just_released("ui_left"):
		_animated_sprite.play("still_up")
	elif Input.is_action_pressed("ui_down"):
		_animated_sprite.flip_h = false
		_animated_sprite.play("walk_down")
		direction.z += 1
	elif Input.is_action_just_released("ui_down"):
		_animated_sprite.play("still_down")
	elif Input.is_action_pressed("ui_up"):
		_animated_sprite.flip_h = false
		_animated_sprite.play("walk_up")
		direction.z -= 1
	elif Input.is_action_just_released("ui_up"):
		_animated_sprite.play("still_up")
			
	if Input.is_action_pressed("ui_select"):
		_animated_sprite.play("jump_down")
		direction.y -= 1

	# Jumping.
	if is_on_floor() and Input.is_action_just_pressed("ui_select"):
		velocity.y += jump_impulse

	velocity.x = direction.x * speed
	velocity.z = direction.z * speed
	velocity.y -= fall_acceleration * delta
	velocity = move_and_slide(velocity, Vector3.UP)
