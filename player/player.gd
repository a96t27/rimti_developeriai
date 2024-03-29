extends CharacterBody2D
class_name Player

@export var speed = 50
@export var health = 4
var movement_direction = Vector2.ZERO

signal health_changed(value)

func _physics_process(delta):
	if health <= 0:
		death()
		
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


func death():
	get_tree().change_scene_to_file("res://game_over_menu/game_over_menu.tscn")

func take_damage():
	health -= 1
	emit_signal("health_changed", health)
