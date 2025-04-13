extends Node2D

@onready var menu: PanelContainer = %MenuContainer
@onready var restart_btn: Button = %Restart
@onready var manager: PongManager = %Manager

# Called when the node enters the scene tree for the first time.
func _ready():
	restart_btn.pressed.connect(_restart_game)
	pass # Replace with function body.

func _restart_game():
	manager.reset()
	menu.visible = false
	get_tree().paused = false


func _process(_delta):
	if Input.is_action_just_pressed("game_menu"):
		get_tree().paused = !menu.visible
		menu.visible = !menu.visible
		pass
	pass
