extends CanvasLayer

signal next_pressed()
signal prev_presssed()
export (String, FILE, "*.json") var d_file

var dialouge = []
var curr_dia_id = -1

func _ready():
	start()

func start():
	dialouge = load_dialogue()
	next_script()
	
func load_dialogue():
	var file = File.new()
	if file.file_exists(d_file):
		file.open(d_file,File.READ)
		return parse_json(file.get_as_text())


func next_script():

	print(len(dialouge))
	if curr_dia_id >= len(dialouge)-1:
		return 
	curr_dia_id += 1
	$NinePatchRect/Name.text = dialouge[curr_dia_id]['name']
	$NinePatchRect/Text.text = dialouge[curr_dia_id]['text']


func prev_script():
	
	
	if curr_dia_id <= 0:
		return
	curr_dia_id -= 1
	$NinePatchRect/Name.text = dialouge[curr_dia_id]['name']
	$NinePatchRect/Text.text = dialouge[curr_dia_id]['text']


func _on_goback_button_up():
	prev_script()
	#emit_signal("prev_presssed")


func _on_gofront_button_up():
	next_script()
	#emit_signal("next_pressed")

