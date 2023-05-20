extends Node2D

export var move_speed = 250
export var moving = false

onready var destination_position


func move(delta):
	if moving:
		$Car.global_position = $Car.global_position.move_toward(destination_position,delta*move_speed)
	if $Car.global_position == destination_position:
		moving = false

func _process(delta):
	move(delta)

func _on_City_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("ui_click") and moving==false:
		destination_position = $City.global_position
		var mouse_position = get_viewport().get_mouse_position()
		var direction = (mouse_position - $Car.position).normalized()
		var new_angle =  PI + atan2(direction.y, direction.x) 
		$Car.rotation  = new_angle
		moving = true
func _on_City2_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("ui_click") and moving==false:
		destination_position = $City2.global_position
		var mouse_position = get_viewport().get_mouse_position()
		var direction = (mouse_position - $Car.position).normalized()
		var new_angle =  PI + atan2(direction.y, direction.x) 
		$Car.rotation  = new_angle
		moving = true
func _on_City3_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("ui_click") and moving==false:
		destination_position = $City3.global_position
		var mouse_position = get_viewport().get_mouse_position()
		var direction = (mouse_position - $Car.position).normalized()
		var new_angle =  PI + atan2(direction.y, direction.x) 
		$Car.rotation  = new_angle
		moving = true
func _on_City4_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("ui_click") and moving==false:
		destination_position = $City4.global_position
		var mouse_position = get_viewport().get_mouse_position()
		var direction = (mouse_position - $Car.position).normalized()
		var new_angle =  PI + atan2(direction.y, direction.x) 
		$Car.rotation  = new_angle
		moving = true
func _on_City5_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("ui_click") and moving==false:
		destination_position = $City5.global_position
		var mouse_position = get_viewport().get_mouse_position()
		var direction = (mouse_position - $Car.position).normalized()
		var new_angle =  PI + atan2(direction.y, direction.x) 
		$Car.rotation  = new_angle
		moving = true
func _on_City6_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("ui_click") and moving==false:
		destination_position = $City6.global_position
		var mouse_position = get_viewport().get_mouse_position()
		var direction = (mouse_position - $Car.position).normalized()
		var new_angle =  PI + atan2(direction.y, direction.x) 
		$Car.rotation  = new_angle
		moving = true
func _on_City7_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("ui_click") and moving==false:
		destination_position = $City7.global_position
		var mouse_position = get_viewport().get_mouse_position()
		var direction = (mouse_position - $Car.position).normalized()
		var new_angle =  PI + atan2(direction.y, direction.x) 
		$Car.rotation  = new_angle
		moving = true
func _on_City8_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("ui_click") and moving==false:
		destination_position = $City8.global_position
		var mouse_position = get_viewport().get_mouse_position()
		var direction = (mouse_position - $Car.position).normalized()
		var new_angle =  PI + atan2(direction.y, direction.x) 
		$Car.rotation  = new_angle
		moving = true
func _on_City9_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("ui_click") and moving==false:
		destination_position = $City9.global_position
		var mouse_position = get_viewport().get_mouse_position()
		var direction = (mouse_position - $Car.position).normalized()
		var new_angle =  PI + atan2(direction.y, direction.x) 
		$Car.rotation  = new_angle
		moving = true
