extends Node2D
class_name PongPaddle

@export var movement_component: MovementController

@onready var area2d: Area2D = $Area2D

var block_up: bool = false
var block_down: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	area2d.area_entered.connect(_on_area_entered)

func _on_area_entered(area: Area2D):
	var area_name = area.name
	if area.get_collision_layer_value(4):
		if area_name == "TopStop":
			block_up = true
		elif area_name == "BotStop":
			block_down = true

func _process(_delta):
	var direction = Vector2.ZERO

	if Input.is_action_pressed("up"):
		if !block_up:
			direction = Vector2.UP
		if block_down:
			block_down = false

	if Input.is_action_pressed("down"):
		if !block_down:
			direction = Vector2.DOWN
		if block_up:
			block_up = false

	if direction != Vector2.ZERO:
		movement_component.move_in_direction(direction)
	else:
		movement_component.stop()
