extends CharacterBody2D

@onready var sprite_2d: AnimatedSprite2D = $Sprite2D
@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var ray_cast_2d_2: RayCast2D = $RayCast2D2
@onready var ray_cast_2d_3: RayCast2D = $RayCast2D3
@onready var ray_cast_2d_4: RayCast2D = $RayCast2D4

@export var SPEED = 300.0
@export var inventory = []

const MILK = preload("res://Scenes/milk.tscn")
const CHIPS = preload("res://Scenes/chips.tscn")

var directionX
var directionY

var found = ""
var foundbody: Node = null

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	directionX = Input.get_axis("move_left", "move_right")
	if directionX:
		velocity.x = directionX * SPEED
		if directionX > 0: sprite_2d.flip_h = true
		else: sprite_2d.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	directionY = Input.get_axis("move_up", "move_down")
	if directionY:
		velocity.y = directionY * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	if !directionX and !directionY:
		sprite_2d.animation = "idle"
	else:
		sprite_2d.animation = "walking"

	move_and_slide()
	
	shelf_detect(ray_cast_2d)
	shelf_detect(ray_cast_2d_2)
	shelf_detect(ray_cast_2d_3)
	shelf_detect(ray_cast_2d_4)

func _process(delta):
	shelf_detect($RayCast2D)

	if Input.is_action_just_pressed("interact") and found == "Shelf" and is_instance_valid(foundbody):
		var item_to_place
		if inventory.has("Milk"):
			item_to_place = MILK.instantiate()
			inventory.erase("Milk")
		elif inventory.has("Chips"):
			item_to_place = CHIPS.instantiate()
			inventory.erase("Chips")
		
		if item_to_place:
			get_parent().add_child(item_to_place)
			item_to_place.global_position = foundbody.item_pos_calc(item_to_place)
			item_to_place.rotation = foundbody.rotation

func shelf_detect(raycast):
	if raycast.is_colliding():
		var collider = raycast.get_collider()
		if collider.name == "Shelf":
			found = "Shelf"
			foundbody = collider
		else:
			found = ""
			foundbody = null


func _on_milk_button_pressed() -> void:
	inventory.append("Milk")

func _on_chips_button_pressed() -> void:
	inventory.append("Chips")
