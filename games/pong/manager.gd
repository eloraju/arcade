extends Node
class_name PongManager

@export var left_score_label: Label
@export var right_score_label: Label
@export var ball: PongBall
@export var left_goal: Area2D
@export var right_goal: Area2D
@export var left_paddle: PongPaddle
@export var right_paddle: PongPaddle

var left_player_score: int = 0
var right_player_score: int = 0

@onready var right_ai: CheckBox = %RP_AI
@onready var left_ai: CheckBox = %LP_AI
@onready var score_sound: AudioStreamPlayer = $Score

# Called when the node enters the scene tree for the first time.
func _ready():
	left_goal.area_entered.connect(add_right_player_score)
	right_goal.area_entered.connect(add_left_player_score)

func add_left_player_score(_area: Area2D):
	print("Left player scored!")
	left_player_score += 1
	left_score_label.text = str(left_player_score)
	score_sound.play()
	ball.reset()

func add_right_player_score(_area: Area2D):
	print("Right player scored!")
	right_player_score += 1
	right_score_label.text = str(right_player_score)
	score_sound.play()
	ball.reset()

func reset():
	left_player_score = 0
	right_player_score = 0
	left_score_label.text = str(left_player_score)
	right_score_label.text = str(right_player_score)
	ball.reset()
	left_paddle.global_position = Vector2(80, 360)
	right_paddle.global_position = Vector2(1200, 360)

func _process(_delta):
	pass
