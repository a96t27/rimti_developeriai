extends Node2D

# Variables to store movement and target information
var velocity: Vector2 = Vector2.ZERO
var target_position: Vector2
var can_change_direction: bool = true

# Constants for movement speed
const speed: float = 100

func _ready():
	# Set initial target position to player's position
	target_position = $Player.global_position

func _process(delta):
	# Calculate direction towards the target position
	var direction_to_target = (target_position - global_position).normalized()

	# Move in the calculated direction
	global_position += direction_to_target * speed * delta

	# If direction changes and can_change_direction is false, reset target position
	if not can_change_direction and velocity != Vector2.ZERO:
		target_position = global_position

func _on_Enemy_body_entered(body: Node) -> void:
	# Set can_change_direction to true when colliding with an object
	can_change_direction = true

func _on_Enemy_body_exited(body: Node) -> void:
	# Set can_change_direction to false when exiting collision with an object
	can_change_direction = false
