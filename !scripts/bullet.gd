extends Area2D

var travelled_distance = 0
const SPEED = 1000
const RANGE = 1200

func _physics_process(_delta):
	
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * _delta
	travelled_distance += SPEED * _delta
	
	if travelled_distance > RANGE:
		queue_free()


func _on_body_entered(body):
	$AudioStreamPlayer2D.play()
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
