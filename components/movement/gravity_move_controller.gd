extends MovementController
class_name GravityMoveController

@export var gravity_values: GravityResource

var grounded: bool = false

func apply_gravity() -> void:
	if !grounded:
		move_vector += gravity_values.get_gravity_vector()
	elif velocity.y > 0:
		velocity.y = 0

func move(target: Node2D, delta: float) -> void:
	if target is CharacterBody2D:
		grounded = target.is_on_floor()

	apply_gravity()
	super.move(target, delta)
