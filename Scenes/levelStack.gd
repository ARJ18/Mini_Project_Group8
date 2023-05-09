extends Node2D

#var stack_item = preload("res://Reusable Scenes/woodPlank.tscn")
const LinkedList = preload("res://Reusable Scenes/LinkedList.gd")
export (PackedScene) var stack_item
onready var curr_item = get_node("woodPlank")
var sel_item = null
onready var stack1 = LinkedList.new()
onready var stack2 = LinkedList.new()
onready var stack3 = LinkedList.new()
var top_color = "a900ff"
var select_color = "#ef8888"
var balance = 3


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	stack1.push_back(get_node("woodPlank"))
	stack2.push_back(get_node("woodPlank2"))
	stack3.push_back(get_node("woodPlank3"))
	
	sel_item = stack1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ImmovableObjects/Balance.set_text("Balance: "+ str(balance))
	sel_item.get_tail_data().modulate = Color(select_color)


func spawn_stack_item(stack_id):
	var new_plank = stack_item.instance()
	add_child(new_plank)
	var curr_pos = stack_id.get_head_data().position
	stack_id.push_back(new_plank)
	#curr_item.modulate = Color.white
	new_plank.position.x = curr_pos.x
	new_plank.position.y = curr_pos.y - 60
	#curr_item.modulate = Color(top_color)

func _on_popButton_button_down():
	if sel_item.size() >1:
		var popped = sel_item.pop_back()
		popped.queue_free()
		balance +=1
		#if !stack.empty():
			#curr_item=stack.back()
			#curr_item.modulate = Color(top_color)
		$popSFX.play()
	else:
		print("Underflow")
		$Warnings/underflowWarning.visible =true


func _on_pushButton_pressed():
	print("Button Pushed")
	if balance!=0:
		balance-=1
		spawn_stack_item(sel_item)
		$pushSFX.play()
	else:
		print("Overflow")
		$Warnings/overflowWarning.visible = true

func _on_woodPlank_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			sel_item.get_tail_data().modulate = Color.white
			sel_item = stack1


func _on_woodPlank2_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			sel_item.get_tail_data().modulate = Color.white
			sel_item = stack2


func _on_woodPlank3_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			sel_item.get_tail_data().modulate = Color.white
			sel_item = stack3


func _on_warnOK_button_up():
	$Warnings/underflowWarning.visible = false


func _on_overOK_button_up():
	$Warnings/overflowWarning.visible = false
