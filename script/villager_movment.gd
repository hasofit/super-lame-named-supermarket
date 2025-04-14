extends Area2D

@onready var player: CharacterBody2D = $"../Player"

var moving: bool = true
var speed: float = 0.03
var inv: Array[String] = ["Milk", "Chips"]
var body: Node = null

@onready var path_follow_2d: PathFollow2D = $"../Path2D/PathFollow2D"
@onready var timer: Timer = $Timer
@onready var ray_cast_1: RayCast2D = $RayCast2D
@onready var ray_cast_2: RayCast2D = $RayCast2D2
@onready var ray_cast_3: RayCast2D = $RayCast2D3
@onready var ray_cast_4: RayCast2D = $RayCast2D4

func _ready():
	timer.start(randf_range(10, 15))

func _process(delta):
	if moving:
		global_position = path_follow_2d.global_position
		path_follow_2d.progress_ratio += delta * speed

	check_raycast_for_groups()

	if Input.is_action_just_pressed("debug"):
		moving = !moving

func _on_timer_timeout() -> void:
	STOP()

func check_raycast_for_groups():
	for ray in [ray_cast_1, ray_cast_2, ray_cast_3, ray_cast_4]:
		if ray and ray.is_colliding():
			body = ray.get_collider()
			if body and body.is_in_group("Inter"):
				if body.is_in_group("Cash"):
					body.pay_out(player, inv)
					body = null
					break
				elif body.is_in_group("Shelf") and !moving:
					body.take_item(inv)
					body = null
					break

func STOP():
	if body and body.is_in_group("Inter") and body.is_in_group("Shelf"):
		moving = !moving
		timer.start(randf_range(10, 15))
	else:
		moving = true
		timer.start(randf_range(5, 10))
	body = null
