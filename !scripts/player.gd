extends CharacterBody2D


const MAX_HEALTH = 100.0
const DAMAGE_RATE = 5.0
# Death colors would range from black to white and modulating alpha
const FINAL_DIE_COLOR = Color(1, 1, 1, 1)
const DIED_COLOR = Color(0.34, 0.34, 0.34, 1)
# Health color
const LOW_HEALTH_COLOR = Color(0, 0.67, 0.85, 1)
const MEDIUM_HEALTH_COLOR = Color(0.76, 0.18, 1, 1)
const HIGH_HEALTH_COLOR = Color(0.88, 0.41, 0, 1)
const SICK_COLOR = Color(0, 0.57, 0.22, 1)
var health = MAX_HEALTH
var phase = 0

signal health_depleted
signal health_damage

func _ready():
	pass

func _physics_process(_delta):
	
	if (health <= 30):
		#Change color to Low
		modulate = LOW_HEALTH_COLOR
	elif (health <= 55):
		#Change color to MEDIUM
		modulate = MEDIUM_HEALTH_COLOR
		
		if health <= 0.0:
			health = 0.0
			health_depleted.emit()

func grow():
	phase += 1

