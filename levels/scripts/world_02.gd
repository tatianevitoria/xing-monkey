extends Node2D

@onready var player := $player as CharacterBody2D
@onready var player_scene = preload("res://actors/player.tscn")

@onready var camera := $camera as Camera2D
@onready var player_start_position: Marker2D = $player_start_position

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globals.player_start_position = player_start_position
	Globals.player = player
	Globals.player.follow_camera(camera)
	Globals.player.player_has_died.connect(game_over)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func reload_game():
	await get_tree().create_timer(1.0).timeout
	var player = player_scene.instantiate()
	add_child(player)
	Globals.player = player
	Globals.player.follow_camera(camera)
	Globals.player.player_has_died.connect(reload_game)
	Globals.lipsticks = 0
	Globals.player_life = 3
	Globals.respawn_player()
	#get_tree().reload_current_scene()

func game_over():
	get_tree().change_scene_to_file("res://prefabs/game_over.tscn")
