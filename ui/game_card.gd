@tool
extends PanelContainer
class_name GameCard

@export var game_name: String = "Game Name"
@export var game_image: Texture2D
@export var game_scene: PackedScene
@export var card_bg_style: StyleBox

@onready var play: Button = %Play
@onready var image: TextureRect = %Image
@onready var label: Label = %Label

func _ready():
	play.pressed.connect(_on_play_pressed)
	_update_values()

func _update_values():
	if card_bg_style != get("theme_override_styles/panel"):
		set("theme_override_styles/panel", card_bg_style)


	if game_image != image.texture:
		image.texture = game_image

	if game_name != label.text:
		label.text = game_name

	play.disabled = game_scene == null

func _on_play_pressed():
	# this might be a bad idea... I _think_ it would be better idea to just pass a idstr or smth
	# and then load the scene in the game_scene container. Possibly even preload all of the games in there
	Globals.start_game.emit(game_scene)

func _process(_delta):
	if Engine.is_editor_hint():
		_update_values()
