extends StaticBody2D

@export var markers: Array[NodePath] = []

@onready var markersfull: Array[Node2D] = []
var used_markers: Array[Node2D] = []
var shelfinv: Array[String] = []
var last_item: String

const MILK = preload("res://Scenes/milk.tscn")
const CHIPS = preload("res://Scenes/chips.tscn")

func _ready():
	for path in markers:
		if has_node(path):
			var node = get_node(path)
			if node is Node2D:
				markersfull.append(node)

func item_pos_calc() -> Vector2:
	for marker in markersfull:
		if not used_markers.has(marker):
			used_markers.append(marker)
			return marker.global_position
	return Vector2.ZERO  # Fallback if none available

func place_item(inventory: Array) -> bool:
	var item_to_place
	var item_type = ""

	if inventory.has("Milk"):
		item_to_place = MILK.instantiate()
		item_type = "Milk"
	elif inventory.has("Chips"):
		item_to_place = CHIPS.instantiate()
		item_type = "Chips"

	if item_to_place:
		var pos = item_pos_calc()
		if pos == Vector2.ZERO:
			return false

		get_parent().add_child(item_to_place)
		item_to_place.global_position = pos
		item_to_place.rotation = rotation
		shelfinv.append(item_type)
		inventory.erase(item_type)
		return true

	return false

func take_item(inv: Array):
	if shelfinv.is_empty() or get_parent().get_child_count() == 0:
		return

	last_item = shelfinv.pop_back()
	inv.append(last_item)

	var parent = get_parent()
	var last_child = parent.get_child(parent.get_child_count() - 1)
	if last_child:
		last_child.queue_free()

	if used_markers.size() > 0:
		var freed_marker = used_markers.pop_back()
