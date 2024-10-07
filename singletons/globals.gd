extends Node

var lipsticks := 0
var player_life := 3

var player = null
var player_start_position = null
var current_checkpoint = null

func respawn_player():
	if current_checkpoint != null:
		player.global_position = current_checkpoint.global_position
	else:
		player.global_position = player_start_position.global_position
