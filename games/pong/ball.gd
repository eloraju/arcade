extends Node2D
class_name PongBall

@export var debug: bool = false:
	set(val):
		debug = val
		movemement_component.debug = val

@export var start_speed: float = 400.0
@export var speed_increase: float = 50.0
@export var movemement_component: MovementController

@onready var area2d: Area2D = $Area2D
@onready var wall_hit: AudioStreamPlayer = $WallHit
@onready var paddle_hit: AudioStreamPlayer = $PaddleHit

var direction: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	area2d.area_entered.connect(_on_collision)
	area2d.body_entered.connect(_on_collision)
	randomize_direction()
	movemement_component.values.max_speed = start_speed

func randomize_direction():
	direction = Vector2(1, 0).rotated(randf_range(0, PI / 3))
	direction = direction if randi() % 2 == 0 else direction * -1
	movemement_component.move_in_direction(direction)

func _on_collision(area: CollisionObject2D):
	# check environment collision
	var parent_name = area.get_parent().name

	if area.get_collision_layer_value(1):
		var normal: Vector2 = Vector2.ZERO
		if parent_name == "Top":
			normal = Vector2.DOWN
		elif parent_name == "Bottom":
			normal = Vector2.UP
		wall_hit.play()
		direction = direction.bounce(normal)


	# check player collision
	if area.get_collision_layer_value(2):
		movemement_component.values.max_speed += speed_increase
		movemement_component.values.acceleration += speed_increase
		direction = calculate_player_bounce(area)
		paddle_hit.play()
	
	movemement_component.move_in_direction(direction)

func calculate_player_bounce(area: CollisionObject2D) -> Vector2:
	# take a vector that from the middle of the paddle to the middle of the ball
	# and make that that be the new bounce vector
	var new_direction = global_position - area.global_position
	return new_direction.normalized()

func reset():
	# Reset the ball to the center of the screen
	global_position = Vector2(690, 360)
	# Randomize the direction
	movemement_component.values.max_speed = start_speed
	randomize_direction()

func _physics_process(delta):
	movemement_component.move(self, delta)
