extends Control

onready var anim = $stackAnim
func _ready():
	$player.set_physics_process(false)
	$AnimElems.visible = false
	$AnimElems/StackPancake.visible = false
	$AnimElems/StackPancake2.visible = false
	$AnimElems/StackPancake3.visible = false
	$AnimElems/TopPointer.visible = false
	$dialogue.connect("next_pressed",self,"handle_anim")
	$AnimElems/StackPancake4.visible = false
	
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

func _on_gohomeBtn_button_up():
	get_tree().change_scene("res://Scenes/levelSelector.tscn")
