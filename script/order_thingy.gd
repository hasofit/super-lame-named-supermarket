extends StaticBody2D

func open_menu(menu, player):
	menu.show()
	player.allowed_move = false
