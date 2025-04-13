extends Area2D

var moving = true
var speed = 0.05

@onready var path_follow_2d: PathFollow2D = $"../Path2D/PathFollow2D"
@onready var timer: Timer = $Timer

func _process(delta):
	if moving == true:
		global_position = path_follow_2d.global_position
		path_follow_2d.progress_ratio += delta * speed

func _ready():
	timer.start(randf_range(10, 15))

func _on_timer_timeout() -> void:
	if moving == false:
		moving = true
	else: moving = false
	
	timer.start(randf_range(10, 15))
