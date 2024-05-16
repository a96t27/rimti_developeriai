class_name Maistas
extends Area2D

signal maistas_suvalgytas


func _on_body_entered(body: Node2D):
	if body.is_in_group("player"):
		maistas_suvalgytas.emit()
		queue_free()
