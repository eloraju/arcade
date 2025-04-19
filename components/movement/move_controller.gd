extends Node2D
class_name MovementController

@export var debug: bool = false
@export var values: MovemementValues

var move_vector: Vector2 = Vector2.ZERO
var velocity: Vector2 = Vector2.ZERO
var should_stop: bool = false

var max_speed_override: float = 0.0
var acceleration_override: float = 0.0

func accelerate_in_direction(direction: Vector2):
	move_vector = direction * get_acceleration()

func accelerate_in_direction_with_overrid(direction: Vector2, acceleration: float):
	move_vector = direction * acceleration

func move_in_direction(direction: Vector2):
	move_vector = direction * get_max_speed()

func move_in_direction_with_override(direction: Vector2, speed: float) -> void:
	move_vector = direction * speed

func decelerate():
	move_vector = velocity * get_acceleration() * -1

func decelerate_with_override(speed: float) -> void:
	move_vector = velocity * speed * -1

func stop():
	velocity = Vector2.ZERO
	move_vector = Vector2.ZERO
	should_stop = true

func apply_move(_velocity: Vector2) -> Vector2:
	_velocity += move_vector
	_velocity = _velocity.limit_length(get_max_speed())
	return _velocity

func get_max_speed() -> float:
	if max_speed_override != 0.0:
		return max_speed_override
	else:
		return values.max_speed
	
func get_acceleration() -> float:
	if acceleration_override != 0.0:
		return acceleration_override
	else:
		return values.acceleration

func reset_max_speed_override():
	max_speed_override = 0.0

func reset_acceleration_override():
	acceleration_override = 0.0

func move(target: Node2D, delta: float) -> void:
	if target is CharacterBody2D:
		if should_stop:
			target.velocity = Vector2.ZERO
		else:
			target.velocity = apply_move(target.velocity)

		target.move_and_slide()
	elif target is RigidBody2D || target is StaticBody2D:
		velocity = apply_move(velocity)
		target.move_and_collide(velocity * delta)
	else:
		velocity = apply_move(velocity)
		target.global_position += velocity * delta
	
	should_stop = false

func _process(_delta):
	if debug:
		queue_redraw()

func _draw():
	if debug:
		draw_line(Vector2.ZERO, velocity, Color(1, 0, 0), 3)
