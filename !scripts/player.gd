extends CharacterBody2D

const max_health = 100.0
const DAMAGE_RATE = 5.0
var health = max_health

signal health_depleted

func _ready():
	change_max_health()
	%ProgressBar.value = max_health

func _physics_process(_delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 600
	move_and_slide()
	
	if velocity.length() > 0.0:
		%HappyBoo.play_walk_animation()
	else:
		%HappyBoo.play_idle_animation()
		
	
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		if $AudioStreamPlayer.playing == false:
			$AudioStreamPlayer.play()
		health -= DAMAGE_RATE * overlapping_mobs.size() * _delta
		%ProgressBar.value = health
		
		if health <= 0.0:
			health = 0.0
			health_depleted.emit()
			

func change_max_health():
	# Add here new health improvements
	%ProgressBar.max_value = max_health


