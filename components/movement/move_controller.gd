extends Node2D
class_name MovementController

@export var debug: bool = false
@export var values: MovemementValues

var move_vector: Vector2 = Vector2.ZERO
var velocity: Vector2 = Vector2.ZERO

var max_speed_override: float = 0.0
var acceleration_override: float = 0.0

var collider: Area2D = null

func calculate_velocity(delta: float) -> void:
	velocity += move_vector * delta
	velocity = velocity.limit_length(get_max_speed())

func move(target: Node2D, delta: float) -> void:
	calculate_velocity(delta)
	target.global_position += velocity

func accelerate_in_direction(direction: Vector2):
	move_vector = direction * get_acceleration()

func move_in_direction(direction: Vector2):
	move_vector = direction * get_max_speed()

func stop():
	velocity = Vector2.ZERO

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

func _process(_delta):
	if debug:
		queue_redraw()

func _draw():
	if debug:
		draw_line(Vector2.ZERO, velocity, Color(1, 0, 0), 3)
