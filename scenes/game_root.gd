extends Node2D

func _ready():
	print(get_window().size)

func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		Globals.toggle_menu.emit()
	pass
