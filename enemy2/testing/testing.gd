extends Node2D


@onready var tile_map = $TileMap
@onready var marker_2d = $Marker2D

func _process(delta):
	marker_2d.global_position = get_global_mouse_position()

func _on_tile_map_child_entered_tree(node):
	if node.is_in_group(&"enemy"):
		node.player = marker_2d
