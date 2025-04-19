extends Node2D

@export var movement: GravityMoveController

@onready var stream: CPUParticles2D = $Gunpack/Stream
@onready var gunpack: Area2D = $Gunpack

func _ready():
	stream.emitting = false

func _physics_process(_delta: float) -> void:
	var direction = Vector2.ZERO
	if Input.is_action_pressed("action_0"):
		stream.emitting = true
		direction = Vector2.UP
	else:
		stream.emitting = false

	movement.accelerate_in_direction(direction)
	movement.move(self, _delta)
