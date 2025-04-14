extends CharacterBody2D

@onready var sprite_2d: AnimatedSprite2D = $Sprite2D
@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var ray_cast_2d_2: RayCast2D = $RayCast2D2
@onready var ray_cast_2d_3: RayCast2D = $RayCast2D3
@onready var ray_cast_2d_4: RayCast2D = $RayCast2D4
@onready var inventory_label: Label = $"../CanvasLayer/Inventory"
@onready var order_menu: Panel = $"../CanvasLayer/Order Menu"
@onready var milk_button: Button = $"../CanvasLayer/Order Menu/Milk Button"
@onready var chips_button: Button = $"../CanvasLayer/Order Menu/Chips Button"
@onready var money_label: Label = $"../CanvasLayer/$"

@export var SPEED = 300.0
@export var inventory = []

var allowed_move = true
var directionX = 0.0
var directionY = 0.0

var found = ""
var foundbody: Node = null

var milk_price = 5
var chips_price = 7
var player_money = 20

func _ready() -> void:
	order_menu.hide()

func _physics_process(delta: float) -> void:
	inventory_label.text = str(inventory)

	# Get movement input
	directionX = Input.get_axis("move_left", "move_right")
	directionY = Input.get_axis("move_up", "move_down")

	if allowed_move:
		velocity.x = directionX * SPEED
		velocity.y = directionY * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	# Flip sprite direction
	if directionX != 0:
		sprite_2d.flip_h = directionX > 0

	# Set animation
	if directionX == 0 and directionY == 0:
		sprite_2d.animation = "idle"
	else:
		sprite_2d.animation = "walking"

	move_and_slide()

	# Check for interactable objects
	shelf_detect(ray_cast_2d)
	shelf_detect(ray_cast_2d_2)
	shelf_detect(ray_cast_2d_3)
	shelf_detect(ray_cast_2d_4)

func _process(delta: float) -> void:
	money_label.text = str(player_money) + "$"
	milk_button.text = "Buy Milk for " + str(milk_price)
	chips_button.text = "Buy Chips for " + str(chips_price)

	shelf_detect(ray_cast_2d)
	
	if Input.is_action_just_pressed("exit"):
		hide_menu()

	if Input.is_action_just_pressed("interact") and is_instance_valid(foundbody):
		if found == "Shelf":
			foundbody.place_item(inventory)
		elif found == "Order":
			foundbody.open_menu(order_menu, self)

func shelf_detect(raycast: RayCast2D) -> void:
	if raycast.is_colliding():
		var collider = raycast.get_collider()
		if collider.get_groups().has("Inter") and collider.get_groups().has("Shelf"):
			found = "Shelf"
			foundbody = collider
		elif collider.get_groups().has("Inter") and collider.get_groups().has("Order"):
			found = "Order"
			foundbody = collider
		else:
			found = ""
			foundbody = null

func _on_milk_button_pressed() -> void:
	if player_money >= milk_price:
		player_money -= milk_price
		inventory.append("Milk")
		milk_price = round(milk_price * 1.01 * 100.0) / 100.0

func _on_chips_button_pressed() -> void:
	if player_money >= chips_price:
		player_money -= chips_price
		inventory.append("Chips")
		chips_price = round(chips_price * 1.01 * 100.0) / 100.0

func _on_exit_order_pressed() -> void:
	hide_menu()
	
func hide_menu():
	order_menu.hide()
	allowed_move = true
