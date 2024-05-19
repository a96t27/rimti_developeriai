class_name gameOverPanel
extends Control



func _on_retry_pressed():
	get_tree().change_scene_to_file(ScoreCount.curscene)


func _on_quit_pressed():
	get_tree().quit()


func _on_mainmenu_pressed():
	get_tree().change_scene_to_file("res://main_menu/main_menu.tscn")
