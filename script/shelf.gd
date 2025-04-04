extends StaticBody2D

@onready var marker1: Marker2D = $Marker2D
@onready var marker2: Marker2D = $Marker2D2
@onready var marker3: Marker2D = $Marker2D3
@onready var marker4: Marker2D = $Marker2D4
@onready var marker5: Marker2D = $Marker2D5
@onready var marker6: Marker2D = $Marker2D6
@onready var marker7: Marker2D = $Marker2D7
@onready var marker8: Marker2D = $Marker2D8
@onready var marker9: Marker2D = $Marker2D9

var marker1full = false
var marker2full = false
var marker3full = false
var marker4full = false
var marker5full = false
var marker6full = false
var marker7full = false
var marker8full = false
var marker9full = false

func item_pos_calc(item):
	if !marker1full:
		marker1full = true
		return marker1.global_position
	elif !marker2full:
		marker2full = true
		return marker2.global_position
	elif !marker3full:
		marker3full = true
		return marker3.global_position
	elif !marker4full:
		marker4full = true
		return marker4.global_position
	elif !marker5full:
		marker5full = true
		return marker5.global_position
	elif !marker6full:
		marker6full = true
		return marker6.global_position
	elif !marker7full:
		marker7full = true
		return marker7.global_position
	elif !marker8full:
		marker8full = true
		return marker8.global_position
	elif !marker9full:
		marker9full = true
		return marker9.global_position
	else:
		print("full")
		return Vector2(0,0)
