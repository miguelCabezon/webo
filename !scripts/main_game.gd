extends Node2D

@onready var player = $Player

func _input(event):
	if event.is_action_pressed("jump"):
		print_debug("action!")
		player.health -= 10
