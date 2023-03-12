extends Node2D


#var stack_item = preload("res://Reusable Scenes/woodPlank.tscn")
export (PackedScene) var stack_item
onready var curr_item = get_node("woodPlank")
var stack = [curr_item]
# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	passs

func spawn_stack_item():
	var new_plank = stack_item.instance()
	add_child(new_plank)
	stack.push_back(new_plank)
	new_plank.position.x =curr_item.position.x
	new_plank.position.y = curr_item.position.y - 73
	curr_item = new_plank


func _on_woodPlank_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed == true:
				print("Hello")


func _on_popButton_button_down():
	var popped = stack.pop_back()
	popped.queue_free()
	curr_item=stack.back()


func _on_pushButton_pressed():
	print("Button Pushed")
	print(curr_item.position)
	spawn_stack_item()
	$pushSFX.play()
