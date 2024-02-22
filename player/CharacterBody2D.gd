extends CharacterBody2D

@export var speed = 400
var movement_direction = Vector2.ZERO

func _physics_process(delta):
	get_input()
	velocity = movement_direction * speed
	move_and_slide()
	
func get_input():
	if Input.is_action_pressed("move_left"):
		movement_direction = Vector2.LEFT
		rotation_degrees = 0
	elif Input.is_action_pressed("move_right"):
		movement_direction = Vector2.RIGHT
		rotation_degrees = 180
	elif Input.is_action_pressed("move_up"):
		movement_direction = Vector2.UP
		rotation_degrees = 90
	elif Input.is_action_pressed("move_down"):
		movement_direction = Vector2.DOWN
		rotation_degrees = 270
