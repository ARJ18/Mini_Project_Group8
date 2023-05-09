extends PopupDialog

onready var settings_data = SaveSettings.data

func _ready():
	$TabContainer/Video/VSyncTog.toggle_mode = settings_data.vsync


func _on_CloseBtn_button_up():
	$".".hide()
