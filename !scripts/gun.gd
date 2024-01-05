extends Area2D

const BULLET = preload("res://scenes/bullet.tscn")

func _physics_process(_delta):
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front()
		look_at(target_enemy.global_position)


func shoot():
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %BulletSpawn.global_position
	new_bullet.global_rotation = %BulletSpawn.global_rotation
	%BulletSpawn.add_child(new_bullet)


func _on_timer_timeout():
	shoot()
