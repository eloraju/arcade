extends MovementController
class_name GravityMoveController

@export var gravity_values: GravityResource

var grounded: bool = false

func apply_gravity(delta: float) -> void:
	if !grounded:
		velocity += gravity_values.get_gravity_vector() * delta
	elif velocity.y > 0:
			velocity.y = 0

func move(target: Node2D, delta: float) -> void:
	apply_gravity(delta)
	super.move(target, delta)
