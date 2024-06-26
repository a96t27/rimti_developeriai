class_name MainMenu
extends Control

@export var start_level: PackedScene

@onready var play_button =  %Play_Button
@onready var options_button = %Options_Button
@onready var quit_button = %Quit_Button
@onready var options_menu: OptionsMenu = %OptionsMenu
@onready var v_box_container: VBoxContainer = $VBoxContainer


func on_play_pressed() -> void:
	ScoreCount.curscene = "res://level/level.tscn"
	get_tree().change_scene_to_packed(start_level)

func on_exit_pressed() -> void:
	get_tree().quit()

func on_options_pressed() -> void:
	v_box_container.hide()
	options_menu.state = true
	await options_menu.exit_options_menu
	v_box_container.show()
