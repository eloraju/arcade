extends CharacterBody2D
class_name PongPaddle

@export var movement_component: MovementController

func _physics_process(delta):
	var direction = Vector2.ZERO

	if Input.is_action_pressed("up"):
			direction = Vector2.UP

	if Input.is_action_pressed("down"):
			direction = Vector2.DOWN

	if direction != Vector2.ZERO:
		movement_component.move_in_direction(direction)
	else:
		movement_component.stop()

	movement_component.move(self, delta)
