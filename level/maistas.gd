extends Area2D

class_name Maistas

signal maistas_suvalgytas(Maistas)

@export var valgyti_priesa = false



func _on_body_entered(body):
	if body.name == "Player":
		maistas_suvalgytas.emit(self)
		queue_free()
		
