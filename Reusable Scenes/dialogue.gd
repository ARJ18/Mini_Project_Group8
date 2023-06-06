extends CanvasLayer

export (String, FILE, "*.json") var d_file

var dialouge = []
var curr_dia_id = -1

func _ready():
	start()
	$AnimationPlayer.play("TextAnim")

func start():
	dialouge = load_dialogue()
	
func load_dialogue():
	var file = File.new()
	if file.file_exists(d_file):
		file.open(d_file,File.READ)
		return parse_json(file.get_as_text())

func next_script():
	curr_dia_id += 1
	
	if curr_dia_id >= len(dialouge):
		return
	$NinePatchRect/Name.text = dialouge[curr_dia_id]['name']
	$NinePatchRect/Text.text = dialouge[curr_dia_id]['text']
