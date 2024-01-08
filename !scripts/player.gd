extends CharacterBody2D


const MAX_HEALTH = 100.0
const DAMAGE_RATE = 5.0
var health = MAX_HEALTH
var phase = 0

signal health_depleted

func _ready():
	pass

func _physics_process(_delta):
	
	if velocity.length() > 0.0:
		%HappyBoo.play_walk_animation()
	else:
		%HappyBoo.play_idle_animation()
		
		if health <= 0.0:
			health = 0.0
			health_depleted.emit()

func grow():
	phase += 1

