extends CharacterBody2D

@onready var sprite_2d: AnimatedSprite2D = $Sprite2D
@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var ray_cast_2d_2: RayCast2D = $RayCast2D2
@onready var ray_cast_2d_3: RayCast2D = $RayCast2D3
@onready var ray_cast_2d_4: RayCast2D = $RayCast2D4

@export var SPEED = 300.0

var directionX
var directionY

var found

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	directionX = Input.get_axis("move_left", "move_right")
	if directionX:
		velocity.x = directionX * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	directionY = Input.get_axis("move_up", "move_down")
	if directionY:
		velocity.y = directionY * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
	
	shelf_detect(ray_cast_2d)
	shelf_detect(ray_cast_2d_2)
	shelf_detect(ray_cast_2d_3)
	shelf_detect(ray_cast_2d_4)

	if Input.is_action_just_pressed("interact"):
		if found == "Shelf":
			print("interacted with shelf")
func shelf_detect(raycast):
	if raycast.is_colliding():
		var collider = raycast.get_collider()
		var col_point = raycast.get_collision_point()
		var local_col_point = to_local(col_point)
		if collider.name == "Shelf":
			found = "Shelf"
