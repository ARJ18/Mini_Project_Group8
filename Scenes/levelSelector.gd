extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass





func _on_stackTutBtn_button_up():
	get_tree().change_scene("res://Scenes/stackTutorial.tscn") 


func _on_stackLevelBtn_button_up():
	get_tree().change_scene("res://Scenes/levelStack.tscn")


func _on_graphTutBtn_button_up():
	pass
	
func _on_graphLevelBtn_button_up():
	get_tree().change_scene("res://Scenes/levelGraph.tscn")


func _on_TextureButton_button_up():
	get_tree().change_scene("res://Scenes/main_menu.tscn") # Replace with function body.
