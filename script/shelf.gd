extends StaticBody2D

@export var markers: Array[NodePath] = []

var markersfull: Array[Node2D] = []

const MILK = preload("res://Scenes/milk.tscn")
const CHIPS = preload("res://Scenes/chips.tscn")

func item_pos_calc(item):
	for path in markers:
		var marker = get_node(path)
		if not markersfull.has(marker):
			markersfull.append(marker)
			return marker.global_position
	
	print("All markers full!")
	return Vector2(0, 0)

func place_item(inventory):
	var item_to_place
	if inventory.has("Milk"):
		item_to_place = MILK.instantiate()
		inventory.erase("Milk")
	elif inventory.has("Chips"):
		item_to_place = CHIPS.instantiate()
		inventory.erase("Chips")
	
	if item_to_place:
		get_parent().add_child(item_to_place)
		item_to_place.global_position = item_pos_calc(item_to_place)
		item_to_place.rotation = rotation
