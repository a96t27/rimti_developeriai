class_name MainMenu
extends Control
@onready var play_button = $MarginContainer/HBoxContainer/VBoxContainer/Play_Button as Button
@onready var options_button = $MarginContainer/HBoxContainer/VBoxContainer/Options_Button as Button
@onready var quit_button = $MarginContainer/HBoxContainer/VBoxContainer/Quit_Button as Button
#@onready var start_level = preload() as PackedScene
func _ready():
	play_button.button_down.connect(on_play_pressed)
	options_button.button_down.connect(on_options_pressed)
	quit_button.button_down.connect(on_exit_pressed)
func on_play_pressed() -> void:
	#get_tree().change_scene_to_packed(start_level)
	pass
func on_exit_pressed() -> void:
	get_tree().quit()
func on_options_pressed() -> void:
	#get_tree().change_scene_to_packed()
	pass
