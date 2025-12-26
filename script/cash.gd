extends StaticBody2D

@onready var menu: Panel = $"../CanvasLayer/Cash Menu"

func _ready() -> void:
	menu.hide()

func pay_out(player, inventory, body):
	if body.is_in_group("Able_to_sell"):
		for i in inventory:
			if i == "Milk":
				player.player_money += player.milk_price_sell
				inventory.erase(i)
			elif i == "Chips":
				player.player_money += player.chips_price_sell
				inventory.erase(i)
			elif i == "Eggs":
				player.player_money += player.eggs_price_sell
				inventory.erase(i)
			else:
				player.player_money += 0
				inventory.erase(i)
	elif body.is_in_group("Player"):
		if menu.visible:
			menu.hide()
		else:
			menu.show()
