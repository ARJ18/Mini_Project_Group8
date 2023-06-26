extends Node2D


onready var playerdata = SavePlayer.udata

# Called when the node enters the scene tree for the first time.
func _ready():
	if !playerdata.tut1:
		$buttonlayout/stackLevelBtn.disabled = true
		$buttonlayout/stackLevelBtn/TextureRect2.visible = true 
	else:
		$buttonlayout/stackLevelBtn.disabled = false
		$buttonlayout/stackLevelBtn/TextureRect2.visible = false

	if !playerdata.tut2:
		$buttonlayout/graphLevelBtn.disabled = true
		$buttonlayout/graphLevelBtn/TextureRect3.visible = true
	else:
		$buttonlayout/graphLevelBtn.disabled = false
		$buttonlayout/graphLevelBtn/TextureRect3.visible = false

	if !playerdata.level1:
		$buttonlayout/graphTutBtn.disabled = true
		$buttonlayout/graphTutBtn/TextureRect2.visible = true
	else:
		$buttonlayout/graphTutBtn.disabled = false
		$buttonlayout/graphTutBtn/TextureRect2.visible = false



func _on_stackTutBtn_button_up():
	get_tree().change_scene("res://Scenes/stackTutorial.tscn") 


func _on_stackLevelBtn_button_up():
	get_tree().change_scene("res://Scenes/levelStack.tscn")


func _on_graphTutBtn_button_up():
	get_tree().change_scene("res://Scenes/graphTutorial.tscn")
	
func _on_graphLevelBtn_button_up():
	get_tree().change_scene("res://Scenes/levelGraph.tscn")


func _on_TextureButton_button_up():
	get_tree().change_scene("res://Scenes/main_menu.tscn") # Replace with function body.


func _on_StackRect_mouse_entered():
	$CanvasLayer/StackRect.modulate = Color("#211056")
	$buttonlayout/stacklabel.modulate = Color.white


func _on_GraphRect_mouse_entered():
	$CanvasLayer/GraphRect.modulate = Color("#211056")
	$buttonlayout/graphlabel.modulate = Color.white


func _on_StackRect_mouse_exited():
	$CanvasLayer/StackRect.modulate = Color("#886fd7")
	$buttonlayout/stacklabel.modulate = Color.black
	
func _on_GraphRect_mouse_exited():
	$CanvasLayer/GraphRect.modulate = Color("#886fd7")
	$buttonlayout/graphlabel.modulate = Color.black


func _on_stackTutBtn_mouse_entered():
	$CanvasLayer/StackRect.modulate = Color("#211056")
	$buttonlayout/stacklabel.modulate = Color.white


func _on_stackLevelBtn_mouse_entered():
	$CanvasLayer/StackRect.modulate = Color("#211056")
	$buttonlayout/stacklabel.modulate = Color.white


func _on_graphTutBtn_mouse_entered():
	$CanvasLayer/GraphRect.modulate = Color("#211056")
	$buttonlayout/graphlabel.modulate = Color.white


func _on_graphLevelBtn_mouse_entered():
	$CanvasLayer/GraphRect.modulate = Color("#211056")
	$buttonlayout/graphlabel.modulate = Color.white
