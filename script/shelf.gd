extends StaticBody2D

@export var marker1: Marker2D
@export var marker2: Marker2D
@export var marker3: Marker2D
@export var marker4: Marker2D
@export var marker5: Marker2D
@export var marker6: Marker2D
@export var marker7: Marker2D
@export var marker8: Marker2D
@export var marker9: Marker2D
@export var marker10: Marker2D
@export var marker11: Marker2D
@export var marker12: Marker2D
@export var marker13: Marker2D
@export var marker14: Marker2D
@export var marker15: Marker2D

var marker1full = false
var marker2full = false
var marker3full = false
var marker4full = false
var marker5full = false
var marker6full = false
var marker7full = false
var marker8full = false
var marker9full = false
var marker10full = false
var marker11full = false
var marker12full = false
var marker13full = false
var marker14full = false
var marker15full = false

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
	elif !marker10full:
		marker10full = true
		return marker10.global_position
	elif !marker11full:
		marker11full = true
		return marker11.global_position
	elif !marker12full:
		marker12full = true
		return marker12.global_position
	elif !marker13full:
		marker13full = true
		return marker13.global_position
	elif !marker14full:
		marker14full = true
		return marker14.global_position
	elif !marker15full:
		marker15full = true
		return marker15.global_position
	else:
		print("full")
		return Vector2(0,0)
