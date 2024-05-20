class_name Level
extends Node2D

var food_count := 0
var goal_count: int = 1000
var levels := {
	level_1 = "res://level/level.tscn",
	level_2 = "res://level/level2.tscn",
	level_3 = "res://level/level3.tscn",
}

@onready var player: Player = $Player
@onready var animation_player = $AnimationPlayer

func _ready():
	ScoreCount.curscene = get_tree().current_scene.scene_file_path
	animation_player.play("scene_starting")

func _on_tile_map_child_entered_tree(node):
	if node.is_in_group(&"enemy"):
		node.player = player
		return
	if node is Maistas:
		node.maistas_suvalgytas.connect(_on_eat_food)

func _on_eat_food():
	food_count = food_count+1
	var name = get_tree().current_scene.scene_file_path
	
	if food_count == 94 && name == levels.level_1:
		animation_player.play("scene_switch")
	elif food_count == 67 && name == levels.level_2:
		animation_player.play("scene_switch")
	elif food_count == 129 && name == levels.level_3:
		animation_player.play("scene_switch")

func next_level():
	food_count = food_count+1
	var name = get_tree().current_scene.scene_file_path
	
	if name == levels.level_1:
		get_tree().change_scene_to_file(levels.level_2)
	elif name == levels.level_2:
		get_tree().change_scene_to_file(levels.level_3)
	elif name == levels.level_3:
		get_tree().change_scene_to_file("res://level/ending.tscn")
