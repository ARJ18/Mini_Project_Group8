extends StaticBody2D
signal mouse_signal

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_woodPlank_mouse_entered():
	print("hello")
	emit_signal("mouse_signal")
