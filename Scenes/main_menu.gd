extends Control

var settings = preload("res://Reusable Scenes/settings.tscn")
onready var bgmusic = get_node("bgMusic")
onready var player = SavePlayer.udata

func _ready():
	bgmusic.play()

func _on_settingsButton_button_up():
	$PopupDialog.popup()


func _on_exitButton_button_up():
	get_tree().quit()


func _on_startButton_button_up():
	var playername = player.charname
	print(playername)
	if playername == "Player1":
		$NameEnter.popup()
	else:
		get_tree().change_scene("res://Scenes/levelSelector.tscn")


func _on_ConfirmBtn_button_up():
	var name = $NameEnter/Entry.text
	player.charname = name
	SavePlayer.save_data()
	print(player.charname)
	get_tree().change_scene("res://Scenes/levelSelector.tscn")
