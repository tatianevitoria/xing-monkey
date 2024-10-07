extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_star_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/world_01.tscn")
	Globals.lipsticks = 0
	Globals.player_life = 3

func _on_quit_btn_pressed() -> void:
	get_tree().quit()
