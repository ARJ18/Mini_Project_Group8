extends Node2D

var stack_item = preload("res://Reusable/wood_plank.tscn")
var available_log = $logAvailable.get_text()
var current_block_loc = $woodPlank.position


# Called when the node enters the scene tree for the first time.
func _ready():
	print(available_log)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_button_down():
	print("Button Pressed")
	print(available_log)
	spawn_block(current_block_loc)


func spawn_block(spawn_location):
	var instance = stack_item.instance()
	instance.global_position.x = spawn_location.x
	instance.global_position.y = spawn_location.y + 1
	add_child(instance)
