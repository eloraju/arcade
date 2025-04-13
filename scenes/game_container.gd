extends Node
class_name GameContainer

@onready var menu: MarginContainer = %MenuRoot
var current_scene: Node = null

func _ready():
	Globals.start_game.connect(switch_game_scene)
	Globals.toggle_menu.connect(toggle_menu)
	Globals.show_menu.connect(show_menu)
	Globals.hide_menu.connect(hide_menu)
	get_tree().paused = true

func switch_game_scene(scene: PackedScene) -> void:
	var new_scene = scene.instantiate()
	add_child(new_scene)
	if current_scene:
		current_scene.queue_free()

	current_scene = new_scene

func show_menu() -> void:
	menu.show()

func hide_menu() -> void:
	menu.hide()

func toggle_menu() -> void:
	if menu.visible:
		get_tree().paused = false
		hide_menu()
	else:
		get_tree().paused = true
		show_menu()
