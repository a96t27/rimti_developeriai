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

@onready var settings_tab_container = $MarginContainer/VBoxContainer/Settings_Tab_Container as SettingsTabContainer

func _ready():
	settings_tab_container.Exit_Options_Menu.connect(_on_back_pressed)
	set_process(false)

func _on_back_pressed() -> void:
	state = false

func toggle_options() -> void:
	visible = !visible
