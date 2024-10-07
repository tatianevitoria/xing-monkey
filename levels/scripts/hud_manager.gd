extends Control

@onready var lipsticks_counter = $container/lipsticks_container/lipsticks_counter as Label
@onready var life_counter: Label = $container/life_container/life_counter

# Atualiza o contador de lipsticks
func _ready() :
	lipsticks_counter.text = "%03d" % Globals.lipsticks 
	life_counter.text = "%02d" % Globals.player_life 

func _process(delta):
	lipsticks_counter.text = "%03d" % Globals.lipsticks 
	life_counter.text = "%02d" % Globals.player_life 
