extends WindowDialog


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$".".popup()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ActionsVideoPlayer_finished():
	$TabContainer/Colors/ActionsVideoPlayer.play() # Replace with function body.


func _on_ActionsVideoPlayer1_finished():
	$TabContainer/Fuel/ActionsVideoPlayer1.play()
