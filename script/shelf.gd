extends StaticBody2D

@export var markers: Array[NodePath] = []
var markersfull: Array[Node2D] = []

func item_pos_calc(item):
	for i in markers:
		var currentmarker = get_node(i)  # Convert NodePath to actual node
		if not markersfull.has(currentmarker):  # Find the first empty spot
			markersfull.append(currentmarker)
			return currentmarker.global_position
	
	print("All markers are full!")
	return Vector2(0,0)  # Only return (0,0) if ALL markers are full
