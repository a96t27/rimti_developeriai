extends CharacterBody2D
class_name Enemy

@export_range(0, 500, 1, "or_greater") var speed = 100

var player: Node2D

var _seek = false

@onready var nav_agent: NavigationAgent2D = $NavigationAgent2D
@onready var sprite = $Sprite


func _physics_process(delta):
	if player == null: return
	nav_agent.target_position = player.global_position
	if nav_agent.is_target_reached(): return
	if _seek:
		var next := nav_agent.get_next_path_position()
		velocity = (next - global_position).normalized() * speed
		move_and_slide()
	else:
		_seek = true

