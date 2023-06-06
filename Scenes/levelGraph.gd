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

func _on_City1_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("ui_click") and moving==false:
		destination_position = $City1.global_position
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
	
#extends Node2D
#
#const FUEL_CONSUMPTION_RATE = 0.5
#const MAX_FUEL = 100
#
#var car : KinematicBody2D
#var cities := []
#
#var currentCityIndex = 0
#var destinationCityIndex = 0
#
#var fuelLabel : Label
#
#var fuel = MAX_FUEL
#var totalDistance = 0
#
#var carMoving = false
#
#func _ready():
#	car = $Car
#	cities = [$City1, $City2, $City3, $City4, $City5, $City6, $City7, $City8, $City9]
#	fuelLabel = $FuelLabel
#
#	car.connect("destination_reached", self, "_on_destination_reached")
#	fuelLabel.text = "Fuel: " + str(fuel)
#
#	car.stop_moving()
#
#	for city in cities:
#		city.connect("input_event", self, "_on_city_input_event")
#
#func _process(delta):
#	if fuel > 0 and carMoving:
#		var direction = cities[destinationCityIndex].position - car.position
#		car.rotation = direction.angle()
#
#		var distance = direction.length()
#		if distance > 1:
#			var velocity = direction.normalized() * car.speed * delta
#			car.move_and_collide(velocity)
#
#			fuel -= FUEL_CONSUMPTION_RATE * velocity.length()
#			fuelLabel.text = "Fuel: " + str(int(fuel))
#
#			if fuel <= 0:
#				car.stop_moving()
#				carMoving = false
#
#func _on_city_input_event(viewport, event, shape_idx):
#	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
#		var clickedCity = cities[shape_idx]
#		destinationCityIndex = cities.find(clickedCity)
#		if destinationCityIndex == currentCityIndex:
#			return
#
#		if !carMoving:
#			car.stop_moving()
#			car.move_to(clickedCity.position)
#			carMoving = true
#
#func _on_destination_reached():
#	totalDistance += cities[currentCityIndex].position.distance_to(cities[destinationCityIndex].position)
#	currentCityIndex = destinationCityIndex
#
#	fuel += MAX_FUEL - FUEL_CONSUMPTION_RATE * totalDistance
#	fuel = clamp(fuel, 0, MAX_FUEL)
#	fuelLabel.text = "Fuel: " + str(int(fuel))
#
#	carMoving = false

