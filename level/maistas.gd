class_name Maistas
extends Area2D

signal maistas_suvalgytas

@onready var sprite_2d = $Sprite2D


func _ready():
	var atlas: AtlasTexture = preload("res://level/resources/ingredients_atlas.tres").duplicate()
	var reg_size: Vector2 = Vector2(16, 16)
	var reg_position: Vector2 = Vector2(16 * (randi()%2),16 * (randi()%2))
	atlas.region = Rect2(reg_position, reg_size)
	sprite_2d.texture = atlas


func _on_body_entered(body: Node2D):
	if body.is_in_group("player"):
		maistas_suvalgytas.emit()
		queue_free()
