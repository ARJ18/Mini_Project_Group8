extends Node2D

var balance = 5
const LinkedList = preload("res://Reusable Scenes/LinkedList.gd")
export (PackedScene) var stack_item
onready var curr_item = get_node("woodPlank")
var sel_item = null
onready var stack1 = LinkedList.new()
onready var stack2 = LinkedList.new()
onready var stack3 = LinkedList.new()
onready var stack4 = LinkedList.new()
var top_color = "a900ff"
var select_color = "#ef8888"

var to = Vector2(120,0)
var from = Vector2(0,0)

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	stack1.push_back(get_node("woodPlank"))
	
	sel_item = stack1
	$Pausemenu.visible = false
	
	$Floater.set_from(from)
	$Floater.set_to(to)
	
	

func _process(delta):
	$ImmovableObjects/balance.set_text("Balance: "+ str(balance))
	sel_item.get_tail_data().modulate = Color(select_color)

func spawn_stack_item(stack_id):
	var new_plank = stack_item.instance()
	add_child(new_plank)
	var curr_pos = stack_id.get_head_data().position
	stack_id.push_back(new_plank)
	#curr_item.modulate = Color.white
	new_plank.position.x = curr_pos.x
	new_plank.position.y = curr_pos.y - 64
	#curr_item.modulate = Color(top_color)


func _on_woodPlank_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			sel_item.get_tail_data().modulate = Color.white
			sel_item = stack1


func _on_underOK_button_up():
	$Warnings/underflowWarning.visible = false


func _on_overOK_button_up():
	$Warnings/overflowWarning.visible = false


func _on_push_button_up():
	print("Button Pushed")
	if balance!=0:
		balance-=1
		spawn_stack_item(sel_item)
		$ImmovableObjects/pushSFX.play()
	else:
		print("Overflow")
		$Warnings/overflowWarning.visible = true


func _on_pop_button_up():
	if sel_item.size() >1:
		var popped = sel_item.pop_back()
		popped.queue_free()
		balance +=1
		#if !stack.empty():
			#curr_item=stack.back()
			#curr_item.modulate = Color(top_color)
		$ImmovableObjects/popSFX.play()
	else:
		print("Underflow")
		$Warnings/underflowWarning.visible =true


func _on_pauseButton_button_up():
	$Pausemenu.visible = true
	$player.set_physics_process(false)
	$ImmovableObjects/push.disabled = true
	$ImmovableObjects/pop.disabled = true


func _on_resume_button_up():
	$player.set_physics_process(true)
	$ImmovableObjects/push.disabled = false
	$ImmovableObjects/pop.disabled = false
