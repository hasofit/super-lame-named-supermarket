extends Area2D

var speed = 0.5

func _process(delta):
	process_ratio += delta * speed
