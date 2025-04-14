extends StaticBody2D

func pay_out(player, inventory):
	for i in inventory:
		if i == "Milk":
			player.player_money += player.milk_price
			inventory.erase(i)
		elif i == "Chips":
			player.player_money += player.chips_price
			inventory.erase(i)
		else:
			player.player_money += 0
			inventory.erase(i)
