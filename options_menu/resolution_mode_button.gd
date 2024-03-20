extends Control

@onready var option_button = $HBoxContainer/OptionButton as OptionButton

const RESOLUTION_DICTIONARY : Dictionary = {
	"480 x 270" : Vector2i(480,270),
	"640 x 480" : Vector2i(640, 480),
	"800 x 600" : Vector2i(800,600),
	"1024 x 768" : Vector2i(1024,768),
	"1280 x 800" : Vector2i(1280,800),
	"1680 x 1050" : Vector2i(1680, 1050),
	"1920 x 1080" : Vector2i(1920, 1080)
}

func _ready():
	option_button.item_selected.connect(on_resolution_selected)
	add_resolution_items()

func add_resolution_items() -> void:
	for resolution_text in RESOLUTION_DICTIONARY:
		option_button.add_item(resolution_text)

func on_resolution_selected(index : int) -> void:
	DisplayServer.window_set_size(RESOLUTION_DICTIONARY.values()[index])
