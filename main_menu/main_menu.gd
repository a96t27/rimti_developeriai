class_name MainMenu
extends Control
@onready var play_button =  %Play_Button
@onready var options_button = %Options_Button
@onready var quit_button = %Quit_Button
@export var start_level: PackedScene
@onready var options_menu = %Options_Menu as OptionsMenu
@onready var margin_container = $MarginContainer as MarginContainer

func _ready():
	handle_connecting_signals()

func on_play_pressed() -> void:
	get_tree().change_scene_to_packed(start_level)

func on_exit_pressed() -> void:
	get_tree().quit()

func on_options_pressed() -> void:
	margin_container.visible = false
	options_menu.set_process(true)
	options_menu.visible = true

func on_back_options_menu() -> void:
	margin_container.visible = true
	options_menu.visible = false

func handle_connecting_signals() -> void:
	options_menu.exit_options_menu.connect(on_back_options_menu)
