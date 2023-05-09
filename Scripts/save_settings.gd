extends Node

const SettingsFile = "user://settings.save"
var data = {}

func _ready():
	load_data()

func save_data():
	var file = File.new()
	file.open(SettingsFile,file.WRITE)
	file.store_var(data)
	file.close()

func load_data():
	var file = File.new()
	if not file.file_exists(SettingsFile):
		data = {
			"vsync": false,
			"bloom": false,
			"brightness": 50,
			"music": 50,
			"sfx": 50
		}
		save_data()
	file.open(SettingsFile,file.READ)
	data = file.get_var()
	file.close()
