extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	$dialogue.connect("next_pressed",self,"handle_anim")
	$dialogue.connect("prev_presssed",self,"handle_backward_anim")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func handle_anim():
	check_speaker()
	dijkstra_image()
	application_text()
	algorithm()
func handle_backward_anim():
	check_speaker()
	dijkstra_image()
	application_text()
	algorithm()
	
func check_speaker():
	if $dialogue.dialouge[$dialogue.curr_dia_id]["name"] == "Guru":
		$Guru.visible = true
		$player.visible = false
	else:
		$Guru.visible = false
		$player.visible =true

func dijkstra_image():
	if $dialogue.curr_dia_id == 2:
		$dijkstra.visible = true
	else: 
		$dijkstra.visible = false		
func application_text():
	if $dialogue.curr_dia_id == 4:
		$application.visible = true
	else: 
		$application.visible = false	
func algorithm():
	if $dialogue.curr_dia_id in range (6,10):
		$algorithm.visible = true
func _on_gohomeBtn_button_up():
	get_tree().change_scene("res://Scenes/levelSelector.tscn") # Replace with function body.
	

