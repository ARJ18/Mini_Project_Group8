extends Node2D

var balance = 3
const LinkedList = preload("res://Reusable Scenes/LinkedList.gd")
export (PackedScene) var stack_item
onready var curr_item = get_node("woodPlank")
var sel_item = null
onready var stack1 = LinkedList.new()
onready var stack2 = LinkedList.new()
onready var stack3 = LinkedList.new()
onready var stack4 = LinkedList.new()
onready var stack5 = LinkedList.new()
var top_color = "a900ff"
var select_color = "#ef8888"
var key_acq = false

var to = Vector2(120,0)
var from = Vector2(0,0)

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	$Floater2.connect("crushed",self,"on_crush")
	$player.connect("fall_out",self,"on_fall")
	stack1.push_back(get_node("woodPlank"))
	stack2.push_back(get_node("woodPlank2"))
	stack3.push_back(get_node("woodPlank3"))
	stack4.push_back(get_node("woodPlank4"))
	stack5.push_back(get_node("woodPlank5"))
	spawn_stack_item(stack2)
	spawn_stack_item(stack4)
	spawn_stack_item(stack5)
	
	sel_item = stack1
	$Pausemenu.visible = false
	$Warnings/crushWarning.visible = false
	$Warnings/fallWarning.visible = false
	$Warnings/keyWarning.visible = false
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

func on_fall():
	$Warnings/fallWarning.popup()

func on_crush():
	$player.queue_free()
	$ImmovableObjects/push.disabled = true
	$ImmovableObjects/pop.disabled = true
	$Warnings/crushWarning.popup()


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

func _on_woodPlank4_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			sel_item.get_tail_data().modulate = Color.white
			sel_item = stack4

func _on_woodPlank5_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			sel_item.get_tail_data().modulate = Color.white
			sel_item = stack5

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


func _on_crushReplay_button_up():
	$Warnings/crushWarning.visible = false
	get_tree().reload_current_scene()


func _on_quitBtn_button_up():
	get_tree().quit()


func _on_fallReplay_button_up():
	$Warnings/fallWarning.visible = false
	get_tree().reload_current_scene()

func _on_ShiningKey_body_entered(body):
	$ShiningKey.visible = false
	key_acq = true
	$InvisibleCollisionobject/Barrier.set_deferred("disabled",true)
	$InvisibleCollisionobject.visible = false

func _on_Portal_body_entered(body):
	print("Level Finished")

func _on_Door_body_entered(body):
	if !key_acq:
		return
	$Door/doorcollison.set_deferred("disabled",true)
	$Door.visible = false
	$Door.monitoring = false
	$Portal.monitoring = true


func _on_keyOK_button_up():
	$Warnings/keyWarning.visible = false
	$player.set_physics_process(true)
	$ImmovableObjects/push.disabled = false
	$ImmovableObjects/pop.disabled = false


func _on_WarningGenerator_body_entered(body):
	if !key_acq:
		$Warnings/keyWarning.popup()
		$player.set_physics_process(false)
		$ImmovableObjects/push.disabled = true
		$ImmovableObjects/pop.disabled = true
		
