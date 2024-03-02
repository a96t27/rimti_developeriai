extends Node2D


@onready var tile_map = $TileMap
@onready var marker_2d = $Marker2D

var map: AStarGrid2D

func _on_tile_map_child_entered_tree(node):
	if node.is_in_group(&"enemy"):
		node.player = marker_2d
		node.map = map
