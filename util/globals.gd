extends Node

enum Team {
	NEUTRAL,
	PLAYER,
	ENEMY,
}

signal start_game(game: PackedScene)
signal toggle_menu
signal show_menu
signal hide_menu
