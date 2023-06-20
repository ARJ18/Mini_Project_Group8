extends StaticBody2D

export var number = 0
func _ready():
	$StackId.text = str(number)
