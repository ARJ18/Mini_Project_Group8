extends Node2D


var stack_item = preload("res://Reusable Scenes/woodPlank.tscn")
onready var curr_item = get_node("woodPlank")
# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_pushButton_button_down():
	print("Button Pushed")
	

func spawn_stack_item(spawn_loc):
	pass


func _on_woodPlank_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed == true:
				print("Hello")
