extends CanvasLayer



func _on_retry_pressed():
	get_tree().change_scene_to_file("res://player/testing/player_test.tscn")


func _on_quit_pressed():
	get_tree().quit()
