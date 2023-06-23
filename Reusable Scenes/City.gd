extends StaticBody2D
export var cityname:String

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$CityName.text += cityname # Replace with function body.

func _process(delta):
	$CityName.modulate = Color.white
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
