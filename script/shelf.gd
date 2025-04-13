extends StaticBody2D

@export var markers: Array[NodePath] = []

var markersfull: Array[Node2D] = []
var shelfinv = []

const MILK = preload("res://Scenes/milk.tscn")
const CHIPS = preload("res://Scenes/chips.tscn")

func item_pos_calc(item) -> Variant:
	for path in markers:
		var marker = get_node(path)
		if not markersfull.has(marker):
			markersfull.append(marker)
			return marker.global_position
	return null

func place_item(inventory: Array) -> bool:
	var item_to_place
	var item_type = ""

	# Check inventory for item to place
	if inventory.has("Milk"):
		item_to_place = MILK.instantiate()
		item_type = "Milk"
	elif inventory.has("Chips"):
		item_to_place = CHIPS.instantiate()
		item_type = "Chips"

	# Try placing the item
	if item_to_place:
		var pos = item_pos_calc(item_to_place)
		if pos != null:
			get_parent().add_child(item_to_place)
			item_to_place.global_position = pos
			item_to_place.rotation = rotation
			shelfinv.append(item_type)
			inventory.erase(item_type)  # Only erase if placed
			return true  # Placement succeeded
	return false  # Placement failed
