extends PathFollow2D

export var moveSpeed = 50
var multiplier = 1

func _ready():
	pass

func _process(delta):
	var curr_offset = get_offset()
	set_offset(curr_offset + (moveSpeed * multiplier) * delta)

func move_floater(offset):
	pass
