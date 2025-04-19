extends Resource
class_name GravityResource

@export var strength: float = 10
@export var direction: Vector2 = Vector2.DOWN

func get_gravity_vector() -> Vector2:
	return direction * strength
