class_name OptionsMenu
extends Control
@onready var back_button = $MarginContainer/VBoxContainer/BackButton as Button
signal exit_options_menu

func _ready():
	back_button.button_down.connect(on_back_pressed)
	set_process(false)

func on_back_pressed() -> void:
	exit_options_menu.emit()
	set_process(false)
