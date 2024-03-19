class_name OptionsMenu
extends Control


signal exit_options_menu

@onready var state: bool = visible:
	set(value):
		state = value
		visible = value
		if not value:
			exit_options_menu.emit()
	get:
		return state
		

func _on_back_pressed() -> void:
	state = false

func toggle_options() -> void:
	visible = !visible
