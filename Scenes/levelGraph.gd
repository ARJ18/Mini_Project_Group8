extends Node2D

const MAX_FUEL = 100

export var move_speed = 250
export var moving = false

onready var destination_position
onready var direction 

var fuelLabel : Label
var fuel = MAX_FUEL
var graph = WeightedAdjacencyMatrix.new(9)
var current_index =  0
var next_index = 0 
func _ready():
	graph_init()	
	fuelLabel = $FuelLabel
	fuelLabel.text = "Fuel : "+str(fuel)
	$Car.global_position = $City0.global_position
	
func move(delta):
	if fuel>0:
		if moving:
			$Car.global_position = $Car.global_position.move_toward(destination_position,delta*move_speed)
			current_index = next_index
		if $Car.global_position == destination_position:
			moving = false
		
			

func _process(delta):
	move(delta)

func setFuel():
	fuel -= graph.getWeight(current_index,next_index)
	if fuel < 0:
		fuel = 0
	fuelLabel.text = "Fuel : "+str(fuel)

func _on_City1_input_event(_viewport, _event, _shape_idx):
	move_to($City0)
func _on_City2_input_event(_viewport, _event, _shape_idx):
	move_to($City1)
func _on_City3_input_event(_viewport, _event, _shape_idx):
	move_to($City2)
func _on_City4_input_event(_viewport, _event, _shape_idx):
	move_to($City3)
func _on_City5_input_event(_viewport, _event, _shape_idx):
	move_to($City4)
func _on_City6_input_event(_viewport, _event, _shape_idx):
	move_to($City5)
func _on_City7_input_event(_viewport, _event, _shape_idx):
	move_to($City6)
func _on_City8_input_event(_viewport, _event, _shape_idx):
	move_to($City7)
func _on_City9_input_event(_viewport, _event, _shape_idx):
	move_to($City8)

func move_to(city):
	
	next_index = int(str(city)[4])
	print(str(current_index) + " " + str(next_index))
	if Input.is_action_just_pressed("ui_click") and moving==false and graph.hasEdge(current_index,next_index):
		destination_position = city.global_position
		direction = (destination_position - $Car.position).normalized()
		var new_angle =  PI + atan2(direction.y, direction.x) 
		$Car.rotation  = new_angle
		moving = true
		setFuel()
		



class WeightedAdjacencyMatrix:

	var numVertices: int
	var matrix: Array

	func _init(vertices: int):
		numVertices = vertices
		matrix = []
		for i in range(numVertices):
			var row = []
			for j in range(numVertices):
				row.append(-1)
			matrix.append(row)

	func addEdge(source: int, destination: int, weight: float):
		if source < 0 or source >= numVertices or destination < 0 or destination >= numVertices:
			print("Invalid vertices.")
			return

		matrix[source][destination] = weight

	func getWeight(source: int, destination: int) -> float:
		if source < 0 or source >= numVertices or destination < 0 or destination >= numVertices:
			print("Invalid vertices.")
			return -1.0

		return matrix[source][destination]
		
	func hasEdge(source: int, destination: int) -> bool:
		if source < 0 or source >= numVertices or destination < 0 or destination >= numVertices:
			print("Invalid vertices.")
			return false
		return matrix[source][destination] != -1	
		
func graph_init():


	graph.addEdge(0, 1, 4.0)
	graph.addEdge(0, 7, 8.0)

	graph.addEdge(1, 0, 4.0)
	graph.addEdge(1, 2, 8.0)
	graph.addEdge(1, 7, 11.0)

	graph.addEdge(2, 1, 8.0)
	graph.addEdge(2, 3, 7.0)
	graph.addEdge(2, 5, 4.0)
	graph.addEdge(2, 8, 2.0)

	graph.addEdge(3, 2, 7.0)
	graph.addEdge(3, 4, 9.0)
	graph.addEdge(3, 5, 14.0)

	graph.addEdge(4, 3, 9.0)
	graph.addEdge(4, 5, 10.0)

	graph.addEdge(5, 2, 4.0)
	graph.addEdge(5, 3, 14.0)
	graph.addEdge(5, 4, 10.0)
	graph.addEdge(5, 6, 2.0)

	graph.addEdge(6, 5, 2.0)
	graph.addEdge(6, 7, 1.0)
	graph.addEdge(6, 8, 6.0)

	graph.addEdge(7, 0, 8.0)
	graph.addEdge(7, 1, 11.0)
	graph.addEdge(7, 6, 1.0)
	graph.addEdge(7, 8, 7.0)

	graph.addEdge(8, 2, 2.0)
	graph.addEdge(8, 6, 6.0)
	graph.addEdge(8, 7, 7.0)

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



func _on_pauseButton_button_up():
	$Pausemenu.visible = true
	set_process(false)


func _on_resume_button_up():
	set_process(true)
