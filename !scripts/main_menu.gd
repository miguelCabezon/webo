extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	%Start.grab_focus()

func _on_start_pressed():
	$MarginContainer/VBoxContainer/HBoxContainer/Start/StartSound.play()
	get_tree().change_scene_to_file("res://scenes/survivors_game.tscn")


func _on_exit_pressed():
	$MarginContainer/VBoxContainer/HBoxContainer/Exit/ExitSound.play()
	$Fade/AnimationPlayer.play("Fade Out")

func _on_animation_player_animation_finished(anim_name):
	match anim_name:
		"Fade Out": get_tree().quit()
