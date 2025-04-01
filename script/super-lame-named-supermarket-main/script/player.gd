extends CharacterBody2D

@onready var sprite_2d: AnimatedSprite2D = $Sprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var directionX
var directionY


func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	directionX = Input.get_axis("move_left", "move_right")
	if directionX:
		velocity.x = directionX * SPEED
		if directionX < 0:
			sprite_2d.flip_h = false
		else:
			sprite_2d.flip_h = true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	directionY = Input.get_axis("move_up", "move_down")
	if directionY:
		velocity.y = directionY * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
