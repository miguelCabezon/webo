extends Node2D

const ENEMY = preload("res://scenes/enemy.tscn")

func _ready():
	spawn_enemy()
	spawn_enemy()
	spawn_enemy()
	spawn_enemy()
	spawn_enemy()
	spawn_enemy()
	spawn_enemy()

func spawn_enemy():
	var new_mob = ENEMY.instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)


func _on_timer_timeout():
	spawn_enemy()


func _on_player_health_depleted():
	%GameOver.visible = true
	get_tree().paused = true
