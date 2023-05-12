extends Control

var settings = preload("res://Reusable Scenes/settings.tscn")
onready var bgmusic = get_node("bgMusic")

func _ready():
	bgmusic.play()


func _on_settingsButton_button_up():
	$PopupDialog.popup()
