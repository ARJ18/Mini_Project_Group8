extends PopupDialog

signal change_brightness(value)

onready var settings_data = SaveSettings.data

func _ready():
	$TabContainer/Video/VSyncTog.pressed = settings_data.vsync
	$TabContainer/Video/BrightSlide.value = settings_data.brightness
	$TabContainer/Audio/musicvol.value = settings_data.music
	$TabContainer/Audio/sfxvol.value = settings_data.sfx

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


func _on_musicvol_drag_ended(value_changed):
	AudioServer.set_bus_volume_db(1,1)   # need to calculate volume according to slider value
	print($TabContainer/Audio/musicvol.value)
