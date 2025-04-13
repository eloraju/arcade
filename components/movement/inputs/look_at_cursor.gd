extends Node
class_name LookAtCursor

@export var rotation_speed: float = 10
@export var rotation_offset: float = 0.0

var target: Node2D

func _ready():
	target = get_parent()


func _process(delta):
	var mouse_position = get_viewport().get_mouse_position()
	var direction = (mouse_position - target.global_position).normalized()
	var target_rotation = direction.angle() + rotation_offset
	target.rotation = lerp_angle(target.rotation, target_rotation, rotation_speed * delta)
