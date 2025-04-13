extends Node
class_name MovementComponent

@export var values: MovemementValues
@export var debug: bool = false

var parent: Node2D
var velocity: Vector2 = Vector2.ZERO

var max_speed_override: float = 0.0
var acceleration_override: float = 0.0

var move_target: Vector2

func _ready():
	parent = get_parent()

func accelerate_in_direction(direction: Vector2, reset_velocity: bool = false):
	var target_velocity = direction * values.max_speed if max_speed_override == 0.0 else direction * max_speed_override

	if reset_velocity:
		velocity = Vector2.ZERO

	velocity = velocity.move_toward(target_velocity, values.acceleration if acceleration_override == 0.0 else acceleration_override)

func move_in_direction(direction: Vector2, reset_velocity: bool = false):
	if reset_velocity:
		velocity = Vector2.ZERO

	velocity = direction * values.max_speed if max_speed_override == 0.0 else direction * max_speed_override

func accelerate_towards(target: Vector2, reset_velocity: bool = false):
	var direction = (target - parent.global_position).normalized()
	accelerate_in_direction(direction, reset_velocity)

func move_towards(target: Vector2, reset_velocity: bool = false):
	var direction = (target - parent.global_position).normalized()
	move_in_direction(direction, reset_velocity)


func decelerate():
	var target_velocity = velocity.normalized() * -1
	velocity = velocity.move_toward(target_velocity, values.deceleration)

func stop():
	velocity = Vector2.ZERO

func reset_max_speed_override():
	max_speed_override = 0.0

func reset_acceleration_override():
	acceleration_override = 0.0

func set_max_speed_override(value: float):
	max_speed_override = value

func set_acceleration_override(value: float):
	acceleration_override = value

func _physics_process(delta: float) -> void:
	if velocity.length() < 2.0:
		stop()

	parent.global_position += velocity * delta
