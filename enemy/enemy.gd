extends CharacterBody2D
class_name Enemy


var player: Node2D

@onready var next_pos = global_position
@onready var nav_agent: NavigationAgent2D = $NavigationAgent2D
@export_range(0, 500, 1, "or_greater") var speed = 100
var map: AStarGrid2D


@onready var sprite = $Sprite

func _physics_process(delta):
	if player == null: return
	nav_agent.target_position = player.global_position
	if nav_agent.is_target_reached():
		return
	var next := nav_agent.get_next_path_position()
	velocity = (next - global_position).normalized() * speed
	move_and_slide()
