extends Control

const HUNGER_MAX_VALUE = 100
var hunger_value = HUNGER_MAX_VALUE

#var time_dilation = 525600 # 365 days
var time_dilation = 1
const time_per_second = 1 # This can change

var CLOCK_MAX_VALUE = 60 * time_dilation
var clock_value = CLOCK_MAX_VALUE

#signals
signal time_passes

func _ready():
	$StatsContainer/HungerProgressBar.max_value = HUNGER_MAX_VALUE
	$StatsContainer/HungerProgressBar.value = hunger_value
	$ClockProgressBar.max_value = CLOCK_MAX_VALUE
	$ClockProgressBar.value = clock_value


func _on_timer_timeout():
	hunger_value -= 10
	if (hunger_value <= 0):
		hunger_value = HUNGER_MAX_VALUE
	$StatsContainer/HungerProgressBar.value = hunger_value
	
	
	clock_value -= time_per_second
	time_passes.emit()
	if (clock_value <= 0):
		clock_value = CLOCK_MAX_VALUE
	$ClockProgressBar.value = clock_value
