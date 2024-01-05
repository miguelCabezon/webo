extends Control

var counter = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	counter = 0
	%Start.grab_focus()
	
func _process(_delta):
	if counter >= 13:
		launch_webpage()

func _on_start_pressed():
	$HBoxContainer/Start/StartSound.play()
	get_tree().change_scene_to_file("res://scenes/main_game.tscn")


func _on_exit_pressed():
	$HBoxContainer/Exit/ExitSound.play()
	$Fade/AnimationPlayer.play("Fade Out")

func _on_animation_player_animation_finished(anim_name):
	match anim_name:
		"Fade Out": get_tree().quit()


func _on_footer_gui_input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			counter += 1
		
		
func launch_webpage():
	OS.shell_open("https://miguelcabezon.itch.io")
	counter = 0


func _on_timer_timeout():
	if $BG.flip_h:
		$BG.flip_h = false
	else:
		$BG.flip_h = true
