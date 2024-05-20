class_name WinningScreen
extends Control

var main_menu: PackedScene = load("res://main_menu/main_menu.tscn")
var start_level: PackedScene = load("res://level/level.tscn")


func _ready():
	$AnimationPlayer.play("open")
	$WinnerSound.play()
	


func _on_restart_button_pressed():
	get_tree().change_scene_to_packed(start_level)


func _on_main_menu_button_pressed():
	get_tree().change_scene_to_packed(main_menu)


func _on_quit_button_pressed():
	get_tree().quit()
