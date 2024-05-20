extends CharacterBody2D
class_name Enemy_2

@export_range(0, 500, 1, "or_greater") var speed = 100
@export var update_interval = 1.0  # Time in seconds to update the target position

var player: Node2D
var _seek = false
var _time_since_last_update = 0.0

@onready var nav_agent: NavigationAgent2D = $NavigationAgent2D
@onready var sprite = $AnimatedSprite2D
@export var offset_range: Vector2 = Vector2(200, 200)  # Change the values to set the range of the offset

func _ready():
	randomize()  # Ensure random numbers are less predictable

func _physics_process(delta):
	if player == null: return
	_change_animation()
	_time_since_last_update += delta
	if _time_since_last_update >= update_interval:
		_time_since_last_update = 0
		update_target_position()

	if nav_agent.is_target_reached(): return
	if _seek:
		var next := nav_agent.get_next_path_position()
		velocity = (next - global_position).normalized() * speed
		move_and_slide()
	else:
		_seek = true


func _change_animation():
	var angle = rad_to_deg(velocity.normalized().angle())
	if angle < -30 and angle > -150:
		sprite.play("rabbit_up")
	elif angle > 30 and angle < 150:
		sprite.play("rabbit_down")
	else:
		sprite.play("rabbit_side")
	sprite.flip_h = abs(angle) > 90


func update_target_position():
	# Generate a random offset within the specified range using randf() and scaling
	var offset_x = (randf() * 2 - 1) * offset_range.x  # Generates a value between -offset_range.x and offset_range.x
	var offset_y = (randf() * 2 - 1) * offset_range.y  # Generates a value between -offset_range.y and offset_range.y
	var offset = Vector2(offset_x, offset_y)

	nav_agent.target_position = player.global_position + offset
