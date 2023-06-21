extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_replay_button_up():
	get_tree().reload_current_scene() # Replace with function body.


func _on_exit_button_up():
	get_tree().change_scene("res://Scenes/levelSelector.tscn") # Replace with function body.
