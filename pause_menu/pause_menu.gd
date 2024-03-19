extends Control
@export var main : Main
@onready var options_menu = %Options_Menu as OptionsMenu
func _ready():
	hide()
	main.connect("toggle_game_paused",_on_main_game_paused)

func _on_main_game_paused(is_paused: bool):
	if(is_paused):
		show()
	else:
		hide()


func _on_resume_button_pressed():
	main.game_paused = false


func _on_quit_button_pressed():
	main.get_tree().quit()


func _on_main_menu_button_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://main_menu/main_menu.tscn")



func _on_options_button_pressed():
	pass
