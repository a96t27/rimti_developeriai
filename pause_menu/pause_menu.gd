class_name PauseMenu
extends Control


var main_menu: PackedScene = load("res://main_menu/main_menu.tscn")

@export var options_menu: OptionsMenu

@onready var state: bool:
	set(value):
		state = value
		visible = value
		get_tree().paused = value
	get:
		return state


func _ready():
	state = visible

func _input(event: InputEvent):
	if event.is_action_pressed(&"pause_menu"):
		state = !state

func _on_resume_button_pressed():
	state = false


func _on_quit_button_pressed():
	get_tree().quit()


func _on_main_menu_button_pressed():
	if main_menu:
		get_tree().paused = false
		get_tree().change_scene_to_packed(main_menu)


func _on_options_button_pressed():
	if options_menu:
		options_menu.show()
		hide()
		set_process_input(false)
		await options_menu.exit_options_menu
		set_process_input(true)
		show()
