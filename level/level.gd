extends Node2D
class_name Level
@onready var player: Player = $Player

func _on_tile_map_child_entered_tree(node):
	if node.is_in_group(&"enemy"):
		node.player = player
