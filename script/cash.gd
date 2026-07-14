extends StaticBody2D

@onready var menu: Panel = $"../CanvasLayer/Cash Menu"

func _ready() -> void:
	menu.hide()

func pay_out(player, inventory, body):
	if body.is_in_group("Able_to_sell"):
	
		for idx in range(inventory.size() - 1, -1, -1):
			var item = inventory[idx]
			var sold = false
			
			if item == "Milk":
				sold = randf() <= player.get_buy_chance(player.milk_price_sell, player.milk_price)
				if sold:
					player.player_money += player.milk_price_sell
			
			elif item == "Chips":
				sold = randf() <= player.get_buy_chance(player.chips_price_sell, player.chips_price)
				if sold:
					player.player_money += player.chips_price_sell
			
			elif item == "Eggs":
				sold = randf() <= player.get_buy_chance(player.eggs_price_sell, player.eggs_price)
				if sold:
					player.player_money += player.eggs_price_sell
			
			elif item == "Boreo":
				sold = randf() <= player.get_buy_chance(player.boreo_price_sell, player.boreo_price)
				if sold:
					player.player_money += player.boreo_price_sell
			
			elif item == "Carrot":
				sold = randf() <= player.get_buy_chance(player.carrot_price_sell, player.carrot_price)
				if sold:
					player.player_money += player.carrot_price_sell
			
			if sold:
				inventory.remove_at(idx)
			else:
				print("Customer refused to buy ", item)

	elif body.is_in_group("Player"):
		menu.show()
		player.allowed_move = false
