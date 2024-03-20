class_name OptionsMenu

extends Control

@onready var back_button = $BackButton as Button
@onready var settings_tab_container = $MarginContainer/VBoxContainer/Settings_Tab_Container as SettingsTabContainer

signal exit_options_menu

func _ready():
	back_button.button_down.connect(on_back_pressed)
	settings_tab_container.Exit_Options_Menu.connect(on_back_pressed)
	set_process(false)

func on_back_pressed() -> void:
	exit_options_menu.emit()
	set_process(false)
