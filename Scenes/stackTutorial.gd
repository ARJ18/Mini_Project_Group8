extends Control

onready var anim = $stackAnim
var stack_top = 4
func _ready():
	$player.set_physics_process(false)
	$AnimElems.visible = false
	$AnimElems/StackPancake.visible = false
	$AnimElems/StackPancake2.visible = false
	$AnimElems/StackPancake3.visible = false
	$AnimElems/TopPointer.visible = false
	$dialogue.connect("prev_presssed",self,"handle_backward_anim")
	$dialogue.connect("next_pressed",self,"handle_anim")
	$AnimElems/StackPancake4.visible = false
	$AnimElems/StackPancake5.visible = false
	$AnimElems/PushBtn.visible = false
	$AnimElems/PushAlgo.visible = false
	$AnimElems/Marker.visible = false
	
func _process(delta):
	$Label.text = str($dialogue.curr_dia_id)

func change_mouseclick():
	if(get_tree().get_root().is_input_disabled()):
		get_tree().get_root().set_disable_input(false)
	else:
		get_tree().get_root().set_disable_input(true)

func handle_anim():
	if $dialogue.curr_dia_id == 1:
		anim.play("StackAppear")
	if $dialogue.curr_dia_id == 2:
		anim.play("TopAppear")
	if $dialogue.curr_dia_id == 3:
		anim.play("TopEmph")
	if $dialogue.curr_dia_id == 4:
		anim.play("Push4")
	if $dialogue.curr_dia_id == 5:
		$AnimElems/PushBtn.visible = true
	if $dialogue.curr_dia_id == 6:
		anim.play("PushAlgoAppear")
	if $dialogue.curr_dia_id == 7:
		anim.play("CodeHighlight")


func handle_backward_anim():
	if $dialogue.curr_dia_id == 0:
		anim.play("StackDisappear")
	if $dialogue.curr_dia_id == 1:
		anim.play_backwards("TopAppear")
	if $dialogue.curr_dia_id == 2:
		anim.play_backwards("TopEmph")
	if $dialogue.curr_dia_id == 3:
		anim.play("Pop4")
	if $dialogue.curr_dia_id == 4:
		anim.play("pop5")
		$AnimElems/PushBtn.visible = false
		stack_top -= 1
		

func _on_gohomeBtn_button_up():
	get_tree().change_scene("res://Scenes/levelSelector.tscn")


func _on_PushBtn_button_up():
	if stack_top == 5:
		print("Overflow")
	else:
		anim.play("Push5")
		stack_top += 1
