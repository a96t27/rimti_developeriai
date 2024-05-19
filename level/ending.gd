extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("ending")

func to_wining_screen():
	get_tree().change_scene_to_packed(preload("res://level/winning_screen.tscn"))

