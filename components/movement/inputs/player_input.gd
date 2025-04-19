extends Node
class_name PlayerMovementComponent

@export var movemement_component: MovementController

func _process(_delta):
	var direction = Vector2.ZERO

	if Input.is_action_pressed("up"):
		direction += Vector2.UP

	if Input.is_action_pressed("down"):
		direction += Vector2.DOWN

	if Input.is_action_pressed("left"):
		direction += Vector2.LEFT

	if Input.is_action_pressed("right"):
		direction += Vector2.RIGHT

	if direction != Vector2.ZERO:
		movemement_component.accelerate_in_direction(direction)
	else:
		movemement_component.decelerate()
