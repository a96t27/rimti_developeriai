extends CharacterBody2D
class_name Player

@export var speed = 50
@export var health = 4

var movement_direction = Vector2.ZERO
var next_movement_direction = Vector2.ZERO
var shape_query = PhysicsShapeQueryParameters2D.new()


@onready var collision_shape_2d = $CollisionShape2D
@onready var direction_pointer = $Direction_pointer


signal health_changed(value)

func _physics_process(delta):
	if health <= 0:
		death()
		
	get_input()
	if movement_direction == Vector2.ZERO:
		movement_direction = next_movement_direction
	if can_move_in_direction(next_movement_direction, delta):
		movement_direction = next_movement_direction
	velocity = movement_direction * speed
	move_and_slide()
	
func get_input():
	if Input.is_action_pressed("move_left"):
		next_movement_direction = Vector2.LEFT
		rotation_degrees = 0
	elif Input.is_action_pressed("move_right"):
		next_movement_direction = Vector2.RIGHT
		rotation_degrees = 180
	elif Input.is_action_pressed("move_up"):
		next_movement_direction = Vector2.UP
		rotation_degrees = 90
	elif Input.is_action_pressed("move_down"):
		next_movement_direction = Vector2.DOWN
		rotation_degrees = 270


func death():
	get_tree().change_scene_to_file("res://game_over_menu/game_over_menu.tscn")

func take_damage():
	health -= 1
	emit_signal("health_changed", health)
	
func can_move_in_direction(dir: Vector2, delta: float) -> bool:
	shape_query.transform = global_transform.translated(dir * speed * delta * 2)
	var result = get_world_2d().direct_space_state.intersect_shape(shape_query)
	return result.size() == 0 
	
func _ready():
	shape_query.shape = collision_shape_2d.shape
	#shape_query.collide_with_areas = false
	#shape_query.collide_with_bodies = true
	shape_query.collision_mask = 2
