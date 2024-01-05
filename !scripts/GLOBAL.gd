extends Node

var score : int = 0

# Movimiento del jugador
var axis : Vector2

# Funcion para retirnar la direccion pulsada
func get_axis() -> Vector2:
	axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	axis.y = int(Input.is_action_pressed("ui_up")) - int(Input.is_action_pressed("ui_down"))
	return axis.normalized()
	
