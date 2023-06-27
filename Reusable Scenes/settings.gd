extends PopupDialog

onready var player_data = SavePlayer.udata
onready var settings_data = SaveSettings.data

func _ready():
	$TabContainer/Video/VSyncTog.pressed = settings_data.vsync
	$TabContainer/Video/BrightSlide.value = settings_data.brightness
	$TabContainer/Audio/musicvol.value = settings_data.music
	set_volume_db(1,settings_data.music)
	$TabContainer/Audio/sfxvol.value = settings_data.sfx
	set_volume_db(2,settings_data.sfx)

func _on_CloseBtn_button_up():
	settings_data.music = $TabContainer/Audio/musicvol.value
	settings_data.sfx = $TabContainer/Audio/sfxvol.value
	SaveSettings.save_data()
	$".".hide()


func _on_VSyncTog_toggled(button_pressed):
	settings_data.vsync = button_pressed
	EnvChanges.change_vsync(button_pressed)
	SaveSettings.save_data()

func _on_BrightSlide_drag_ended(value_changed):
	if value_changed:
		settings_data.brightness = $TabContainer/Video/BrightSlide.value

func set_volume_db(bus,percent):
	if percent == 0:
		AudioServer.set_bus_mute(bus,true)
	else:
		AudioServer.set_bus_mute(bus,false)
		if percent >= 95:
			AudioServer.set_bus_volume_db(bus,5.00)
		elif percent >= 60 and percent < 95:
			AudioServer.set_bus_volume_db(bus,0.00)
		elif percent >= 30 and percent < 60:
			AudioServer.set_bus_volume_db(bus,-3.00)
		elif percent >= 10 and percent < 30:
			AudioServer.set_bus_volume_db(bus,-7.00)
		elif percent > 0 and percent < 10:
			AudioServer.set_bus_volume_db(bus,-20.00)

func _on_musicvol_drag_ended(value_changed):
	var percentage = $TabContainer/Audio/musicvol.value
	set_volume_db(1,percentage)


func _on_sfxvol_drag_ended(value_changed):
	var percentage = $TabContainer/Audio/sfxvol.value
	set_volume_db(2,percentage)


func _on_ResetBtn_button_up():
	player_data.charname = "Player1"
	player_data.tut1 = false
	player_data.level1 = false
	player_data.tut2 = false
	player_data.level2 = false
	SavePlayer.save_data()
	get_tree().change_scene("res://Scenes/main_menu.tscn")
