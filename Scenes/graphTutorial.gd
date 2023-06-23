extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	 $dialogue.connect("next_pressed",self,"handle_anim")
	 $dialogue.connect("prev_presssed",self,"handle_backward_anim")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_gohomeBtn_button_up():
	get_tree().change_scene("res://Scenes/levelSelector.tscn") # Replace with function body.
