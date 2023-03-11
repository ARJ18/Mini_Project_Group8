extends Node2D

var stack_item = preload("res://Reusable/wood_plank.tscn")
var current_block_loc = $woodPlank.position
var available_log = int($logAvailable.text)

# Called when the node enters the scene tree for the first time.
func _ready():
	print(available_log)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_button_down():
	print("Button Pressed")
	available_log -= 1
	print(available_log)
	spawn_block(current_block_loc)


func spawn_block(spawn_location):
	var instance = stack_item.instance()
	instance.global_position = spawn_location
	add_child(instance)
