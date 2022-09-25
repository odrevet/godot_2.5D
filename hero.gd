extends KinematicBody

enum Direction {UP, RIGHT, DOWN, LEFT}
var direction = Direction.DOWN

export var speed = 14
export var fall_acceleration = 75
var velocity = Vector3.ZERO
export var jump_impulse = 20

onready var _animated_sprite = $AnimatedSprite3D


func _physics_process(delta):
	var direction_vector = Vector3.ZERO

	if Input.is_action_pressed("ui_right"):
		_animated_sprite.flip_h = true
		_animated_sprite.play("walk_down")
		direction = Direction.RIGHT
		direction_vector.x += 1
	elif Input.is_action_just_released("ui_right"):
		_animated_sprite.play("still_down")
	elif Input.is_action_pressed("ui_left"):
		direction = Direction.LEFT
		_animated_sprite.flip_h = true
		_animated_sprite.play("walk_up")
		direction_vector.x -= 1
	elif Input.is_action_just_released("ui_left"):
		_animated_sprite.play("still_up")
	elif Input.is_action_pressed("ui_down"):
		direction = Direction.DOWN
		_animated_sprite.flip_h = false
		_animated_sprite.play("walk_down")
		direction_vector.z += 1
	elif Input.is_action_just_released("ui_down"):
		_animated_sprite.play("still_down")
	elif Input.is_action_pressed("ui_up"):
		direction = Direction.UP
		_animated_sprite.flip_h = false
		_animated_sprite.play("walk_up")
		direction_vector.z -= 1
	elif Input.is_action_just_released("ui_up"):
		_animated_sprite.play("still_up")
			
	if Input.is_action_pressed("ui_select"):
		if direction == Direction.UP or direction == Direction.LEFT: 
			_animated_sprite.play("jump_up")
		else :
			_animated_sprite.play("jump_down")
		direction_vector.y -= 1

	# Jumping.
	if is_on_floor() and Input.is_action_just_pressed("ui_select"):
		velocity.y += jump_impulse

	velocity.x = direction_vector.x * speed
	velocity.z = direction_vector.z * speed
	velocity.y -= fall_acceleration * delta
	velocity = move_and_slide(velocity, Vector3.UP)
	
	
	# Teleports shortcuts
	if Input.is_action_pressed("ui_focus_next"):
		get_tree().change_scene("res://level_2.tscn")
		
	if Input.is_action_pressed("ui_focus_prev"):
		get_tree().change_scene("res://level.tscn")
	
	
	

