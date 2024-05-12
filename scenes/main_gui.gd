extends Control

const HUNGER_MAX_VALUE = 100
var hunger_value = HUNGER_MAX_VALUE

const CLOCK_MAX_VALUE = 60
var clock_value = CLOCK_MAX_VALUE

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
	
	clock_value -= 1
	if (clock_value <= 0):
		clock_value = CLOCK_MAX_VALUE
	$ClockProgressBar.value = clock_value


func _on_give_food_button_pressed():
	print("food given!")


func _on_give_beverage_button_pressed():
	print("drink!")


func _on_heal_button_pressed():
	print("a nice heal!")


func _on_play_button_pressed():
	print("let's play!")
