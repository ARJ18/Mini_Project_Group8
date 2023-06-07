extends Control

var settings = preload("res://Reusable Scenes/settings.tscn")
onready var bgmusic = get_node("bgMusic")

func _ready():
	bgmusic.play()


func _on_settingsButton_button_up():
	$PopupDialog.popup()


func _on_exitButton_button_up():
	get_tree().quit()


func _on_startButton_button_up():
	get_tree().change_scene("res://Scenes/levelSelector.tscn")
