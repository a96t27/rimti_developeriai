class_name Player
extends CharacterBody2D

signal health_changed(value)

@export var speed = 50
@export var max_health = 4

var current_health: int = max_health
var movement_direction: Vector2 = Vector2.ZERO
var next_movement_direction: Vector2 = Vector2.ZERO
var home: Marker2D
var shape_query: PhysicsShapeQueryParameters2D = PhysicsShapeQueryParameters2D.new()
var levels := {
	level_1 = "res://level/level.tscn",
	level_2 = "res://level/level2.tscn",
	level_3 = "res://level/level3.tscn",
}
@onready var collision_shape_2d: CollisionShape2D = $PlayerCollisionShape

var food_count = 0

func _ready():
	shape_query.shape = collision_shape_2d.shape
	shape_query.collision_mask = 1
	var markers := get_tree().get_nodes_in_group("Markers")
	if markers.size() > 1:
		home = get_tree().get_nodes_in_group("Markers")[1]


func _physics_process(delta: float) -> void:
	if current_health <= 0:
		death()
		return
		
	get_input()
	try_change_direction()
	move_character(delta)

func eat_food():
	food_count = food_count+1
	var name = get_tree().current_scene.scene_file_path
	
	if food_count == 94 && name == levels.level_1:
		ScoreCount.curscene = levels.level_2
		get_tree().change_scene_to_file(levels.level_2)
	elif food_count == 67 && name == levels.level_2:
		ScoreCount.curscene = levels.level_3
		get_tree().change_scene_to_file(levels.level_3)
	elif food_count == 129 && name == levels.level_3:
		get_tree().change_scene_to_file("res://level/ending.tscn")

func get_input() -> void:
	var dir = Vector2.ZERO
	if Input.is_action_pressed("move_left"):
		dir = Vector2.LEFT
		rotation_degrees = 0
	elif Input.is_action_pressed("move_right"):
		dir = Vector2.RIGHT
		rotation_degrees = 180
	elif Input.is_action_pressed("move_up"):
		dir = Vector2.UP
		rotation_degrees = 90
	elif Input.is_action_pressed("move_down"):
		dir = Vector2.DOWN
		rotation_degrees = 270

	if dir != Vector2.ZERO:
		next_movement_direction = dir


func death() -> void:
	get_tree().change_scene_to_file("res://game_over_menu/game_over_menu.tscn")


func take_damage() -> void:
	current_health -= 1
	emit_signal("health_changed", current_health)


func can_move_in_direction(dir: Vector2, delta: float) -> bool:
	shape_query.transform = global_transform.translated(dir * (speed * delta + 1))
	var result = get_world_2d().direct_space_state.intersect_shape(shape_query)
	return result.size() == 0 


func try_change_direction() -> void:
	if next_movement_direction != Vector2.ZERO and can_move_in_direction(next_movement_direction, 0):
		# Change the direction if the new direction is valid
		movement_direction = next_movement_direction
		next_movement_direction = Vector2.ZERO
	elif not can_move_in_direction(movement_direction, 0):
		# If the current direction is blocked, stop the movement
		movement_direction = Vector2.ZERO


func move_character(delta: float) -> void:
	if movement_direction != Vector2.ZERO:
		velocity = movement_direction * speed
		move_and_slide()
	else:
		velocity = Vector2.ZERO


func _on_area_2d_body_entered(body):
	if body.has_method("enemy"):
		take_damage()
		get_tree().get_nodes_in_group("enemy")[0].position = get_tree().get_nodes_in_group("Markers")[0].position
		position = get_tree().get_nodes_in_group("Markers")[1].position
