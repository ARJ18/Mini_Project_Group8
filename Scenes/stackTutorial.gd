extends Control

onready var anim = $stackAnim
onready var playerdata = SavePlayer.udata
var stack_top = 4
var is_pushed = false
var option = 0
func _ready():
	$player.set_physics_process(false)
	$AnimElems.visible = false
	$dialogue.get_node("goback").disabled = false
	$dialogue.get_node("gofront").disabled = false
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
	$AnimElems/PopBtn.visible = false
	$PopLayer.visible = false
	$PopLayer/PopMarker.visible = false
	$PopLayer/PushAlgo.visible = false


func change_mouseclick():
	if(get_tree().get_root().is_input_disabled()):
		get_tree().get_root().set_disable_input(false)
	else:
		get_tree().get_root().set_disable_input(true)

func pop_items(val):
	$PopLayer/WrongPop.visible = val
	$PopLayer/RightPop.visible = val
	$PopLayer/PopAlgoWrong.visible = val
	$PopLayer/ConfirmOption.visible = val

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
		$AnimElems/PushBtn.visible = true		#push button visible
		$dialogue.get_node("goback").disabled = true
		$dialogue.get_node("gofront").disabled = true
	if $dialogue.curr_dia_id == 6:
		anim.play("PushAlgoAppear")				#push algo appear
	if $dialogue.curr_dia_id == 7:
		anim.play("OverflowHighlight")			#condition check highlight
	if $dialogue.curr_dia_id == 8:
		anim.play("TopAddHighlight")			#pushing highlight
		anim.queue("OverflowHighlight")
	if $dialogue.curr_dia_id == 9:
		$AnimElems/PushBtn.visible = false		#remove all push elements
		$AnimElems/PushAlgo.visible = false
		$AnimElems/Marker.visible = false
		anim.stop(true)
	if $dialogue.curr_dia_id == 10:
		var text = $AnimElems/StackPancake5.get_node("StackId")
		text.add_color_override("font_color",Color.red)
		anim.play("Stack5Highlight")			#stack5 scale anim
	if $dialogue.curr_dia_id == 11:
		$AnimElems/PopBtn.visible = true		#introduce pop button
		$dialogue.get_node("goback").disabled = true
		$dialogue.get_node("gofront").disabled = true
	if $dialogue.curr_dia_id == 13:				#introduce pop options
		$AnimElems.visible = false
		$PopLayer.visible = true
		if option == 0:
			$dialogue.get_node("goback").disabled = true
			$dialogue.get_node("gofront").disabled = true
	if $dialogue.curr_dia_id == 14:				#explain underflow
		$dialogue.get_node("goback").disabled = false
		$dialogue.get_node("gofront").disabled = false
		pop_items(false)
		$PopLayer/PopMarker.visible = true
		anim.play("MarkUnderflow")
	if $dialogue.curr_dia_id == 15:				#explain poping
		anim.stop()
		anim.play("PopMark")
		anim.queue("MarkUnderflow")
	if $dialogue.curr_dia_id == 16:				#display both
		anim.stop()
		$PopLayer/PopMarker.visible = false
		$PopLayer/PushAlgo.visible = true
		$PopLayer/PushAlgotitle.visible = true
		$PopLayer/PopAlgotitle.visible = true
	if $dialogue.curr_dia_id == 17:
		$FinishBtn.visible = true


func handle_backward_anim():
	if $dialogue.curr_dia_id == 0:
		anim.play("StackDisappear")
	if $dialogue.curr_dia_id == 1:
		anim.play_backwards("TopAppear")
	if $dialogue.curr_dia_id == 2:
		anim.seek(0.00,true)
		anim.stop(true)
	if $dialogue.curr_dia_id == 3:
		anim.play("Pop4")
		anim.queue("TopEmph")
	if $dialogue.curr_dia_id == 4:
		if is_pushed:
			pop5()
		$AnimElems/PushBtn.visible = false
	if $dialogue.curr_dia_id == 5:
		pop5()
		$AnimElems/PushAlgo.visible = false
		$dialogue.get_node("goback").disabled = true
		$dialogue.get_node("gofront").disabled = true
	if $dialogue.curr_dia_id == 6:
		anim.seek(0.00,true)
		anim.stop(true)
		$AnimElems/Marker.visible = false
	if $dialogue.curr_dia_id == 7:
		anim.play_backwards("TopAddHighlight")		#pushing part highlight
		anim.queue("OverflowHighlight")
	if $dialogue.curr_dia_id == 8:
		$AnimElems/PushBtn.visible = true
		$AnimElems/PushAlgo.visible = true
		$AnimElems/Marker.visible = true			#bring back push elements
		anim.queue("OverflowHighlight")
	if $dialogue.curr_dia_id == 9:
		anim.seek(0.00,true)
		anim.stop(true)
		var text = $AnimElems/StackPancake5.get_node("StackId")
		text.add_color_override("font_color",Color.black)
	if $dialogue.curr_dia_id == 10:
		anim.stop(true)
		if !is_pushed:
			push5()
		anim.queue("Stack5Highlight")
		var text = $AnimElems/StackPancake5.get_node("StackId")
		text.add_color_override("font_color",Color.red)	#remove stack5 color
	if $dialogue.curr_dia_id == 11:
		anim.stop(true)
		push5()
		$PopLayer.visible = false
		$AnimElems.visible = true
	if $dialogue.curr_dia_id == 12:
		$PopLayer.visible = false
		$dialogue.get_node("goback").disabled = false
		$dialogue.get_node("gofront").disabled = false
	if $dialogue.curr_dia_id == 13:
		anim.stop(true)
		$AnimElems.visible = false
		$PopLayer.visible = true
		$PopLayer/ConfirmOption.disabled = true
		pop_items(true)
		$PopLayer/PopMarker.visible = false
	if $dialogue.curr_dia_id == 14:
		anim.stop(true)
		anim.play_backwards("PopMark")
		anim.queue("MarkUnderflow")
	if $dialogue.curr_dia_id == 15:
		$PopLayer/PopMarker.visible = true
		$PopLayer/PushAlgo.visible = false
		$PopLayer/PushAlgotitle.visible = false
		$PopLayer/PopAlgotitle.visible = false
		anim.play("MarkUnderflow")
	if $dialogue.curr_dia_id == 16:
		$FinishBtn.visible = false

func _on_gohomeBtn_button_up():
	get_tree().change_scene("res://Scenes/levelSelector.tscn")

func push5():
	anim.play("Push5")
	is_pushed = true
	stack_top += 1

func pop5():
	anim.play("pop5")
	is_pushed = false
	stack_top -= 1
	
func _on_PushBtn_button_up():
	if stack_top == 5:
		print("Overflow")
	else:
		push5()
	$dialogue.get_node("goback").disabled = false
	$dialogue.get_node("gofront").disabled = false


func _on_PopBtn_button_up():
	if stack_top == 5:
		pop5()
	else:
		print("Underflow")
	$dialogue.get_node("goback").disabled = false
	$dialogue.get_node("gofront").disabled = false




func _on_ConfirmOption_button_up():
	if(option !=0):
		if(option == 1):
			print("Wrong")
			$CanvasLayer/Lost.popup()
		if(option == 2):
			print("Right")
			$CanvasLayer/Success.popup()
	else:
		$CanvasLayer/SelectOption.popup()


func _on_RightPop_pressed():
	option = 2
	$PopLayer/RightPop.disabled = true
	$PopLayer/WrongPop.disabled = false
	if $PopLayer/WrongPop.pressed:
		$PopLayer/WrongPop.pressed = false


func _on_WrongPop_pressed():
	option = 1
	$PopLayer/RightPop.disabled = false
	$PopLayer/WrongPop.disabled = true
	if $PopLayer/RightPop.pressed:
		$PopLayer/RightPop.pressed = false

func _on_SucNext_button_up():
	$dialogue.next_script()
	$CanvasLayer/Success.visible =false
	handle_anim()


func _on_lostNext_button_up():
	$dialogue.next_script()
	$CanvasLayer/Lost.visible = false
	handle_anim()


func _on_FinishBtn_button_up():
	$CanvasLayer2.visible = true
	playerdata.tut1 = true
	SavePlayer.save_data()
