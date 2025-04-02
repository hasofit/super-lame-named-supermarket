extends PathFollow2D

var moving = true
var speed = 0.1
@onready var timer: Timer = $Villager/Timer

func _process(delta):
	if moving == true:
		progress_ratio += delta * speed

func _ready():
	timer.start(randf_range(10, 15))

func _on_timer_timeout() -> void:
	if moving == false:
		moving = true
	else: moving = false
	
	timer.start(randf_range(10, 15))
