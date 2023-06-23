extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



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
