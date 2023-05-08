extends StaticBody2D

var plank_location
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_woodPlank_mouse_entered():
	plank_location = get_global_mouse_position()
