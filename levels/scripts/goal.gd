extends Area2D

@onready var transition = get_parent().get_node("transition")
@export var next_level: String = ""


func _on_body_entered(body: Node2D) -> void:
	if body.name == "player" and !next_level == "" and Globals.lipsticks >= 7:
		transition.change_scene(next_level)
	else:
		print("No Scene Loaded")
