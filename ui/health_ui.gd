extends CanvasLayer

var hearts = 4
var maxHearts = 4
@onready var player = get_parent().get_node("Player")
@onready var healthEmpty = $HealthUIEmpty
@onready var healthFull = $HealthUIFull

# Called when the node enters the scene tree for the first time.
func _ready():
	if player != null:
		player.health_changed.connect(change_texture)

func change_texture(value):
	hearts = value
	if hearts >= 0:
		if hearts <= maxHearts:
			healthFull.size.x = hearts * 32
