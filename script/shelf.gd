extends StaticBody2D

@export var markers: Array[NodePath] = []
var markersfull: Array[Node2D] = []

func item_pos_calc(item):
	for path in markers:
		var marker = get_node(path)
		if not markersfull.has(marker):
			markersfull.append(marker)
			return marker.global_position
	
	print("All markers full!")
	return Vector2(0, 0)
