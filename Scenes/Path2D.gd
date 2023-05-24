extends Path2D

export var moveSpeed = 5

func _ready():
	pass

func _process(delta):
	set_offset(get_offset + moveSpeed * delta)
