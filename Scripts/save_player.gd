extends Node

const UserFile = "user://userdata.save"
var udata = {}

func _ready():
	load_data()

func save_data():
	var file = File.new()
	file.open(UserFile,file.WRITE)
	file.store_var(udata)
	file.close()

func load_data():
	var file = File.new()
	if not file.file_exists(UserFile):
		udata = {
			"charname" : "Player1",
			"tut1": false,
			"level1": false,
			"tut2": false,
			"level2": false,
			"tut3": false,
			"level3": false,
			"hints": 0,
			"level1stars": 0,
			"level2stars": 0,
			"level3stars": 0
		}
		save_data()
	file.open(UserFile,file.READ)
	udata = file.get_var()
	file.close()
