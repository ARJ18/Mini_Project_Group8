extends Control

var settings = preload("res://Reusable Scenes/settings.tscn")

func _ready():
	pass


func _on_settingsButton_button_up():
	$PopupDialog.popup()
