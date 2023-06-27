extends Control

onready var initialtext = $Graph/Dist2.text
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var graphNodes = {
	1:"Graph/Node",
	2:"Graph/Node2",
	3:"Graph/Node3",
	4:"Graph/Node4",
	5:"Graph/Node5"
	
}

# Called when the node enters the scene tree for the first time.
func _ready():

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
	graph_visible()
	graph()
func handle_backward_anim():
	check_speaker()
	dijkstra_image()
	application_text()
	algorithm()
	graph_visible()
	graph()
	
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
	if $dialogue.curr_dia_id in range (6,9):
		$algorithm.visible = true
	else: 
		$algorithm.visible = false		
func graph_visible():
	if $dialogue.curr_dia_id >= 10:
		$Graph.visible = true
		$algorithm2.visible = true
	else:
		$Graph.visible = false
		$algorithm2.visible = false	

func graph_color(node,color):
	get_node(graphNodes[node]).modulate = color
	
func reset_color(node):
	get_node(graphNodes[node]).modulate = Color.white
	
	
func graph():
	if $dialogue.curr_dia_id>=11:
		graph_color(1,Color.lightcoral)
	else:
		reset_color(1)
	if $dialogue.curr_dia_id>=12:
		$Graph/Dist1.visible = true
	else:
		$Graph/Dist1.visible = false
	if $dialogue.curr_dia_id>=13:
		for i in range(2,6):
			get_node("Graph/Dist"+str(i)).visible = true
	else:
		for i in range(2,6):
			get_node("Graph/Dist"+str(i)).visible = false	
	if $dialogue.curr_dia_id>=16:
		graph_color(2,Color.lightyellow)
		graph_color(3,Color.lightyellow)
	else:
		reset_color(2)
		reset_color(3)
		
	if $dialogue.curr_dia_id>=17:
		$Graph/Dist2.text = "4"
		$Graph/Dist3.text = "2"
	else:
		$Graph/Dist2.text = initialtext
		$Graph/Dist3.text = initialtext
	if  $dialogue.curr_dia_id>=19:
		graph_color(1,Color.lightgreen)
		reset_color(2)
		graph_color(3,Color.lightcoral)
	if  $dialogue.curr_dia_id>=20:
		graph_color(4,Color.lightyellow)
	else:
		reset_color(4)
	if  $dialogue.curr_dia_id>=21:
		$Graph/Dist4.text = "5"
	else:
		$Graph/Dist4.text = initialtext
	if $dialogue.curr_dia_id>=23:
		graph_color(3,Color.lightgreen)
		graph_color(2,Color.lightcoral)
		reset_color(4)
	
	if $dialogue.curr_dia_id>=25:
		graph_color(4,Color.lightyellow)
	
	if $dialogue.curr_dia_id>=28:
		graph_color(2,Color.lightgreen)
		graph_color(4,Color.lightcoral)
	if $dialogue.curr_dia_id>=30:
		graph_color(5,Color.lightyellow)
	else:
		reset_color(5)
	if $dialogue.curr_dia_id>=31:
		$Graph/Dist5.text = "10"
	else:
		$Graph/Dist5.text = initialtext
	if $dialogue.curr_dia_id>=33:
		graph_color(4,Color.lightgreen)
		graph_color(5,Color.lightcoral)
	if $dialogue.curr_dia_id>=37:
		graph_color(5,Color.lightgreen)
	
	if$dialogue.curr_dia_id>=40:
		$Graph.visible = false
		$algorithm2.visible = false
		
		

	

func _on_gohomeBtn_button_up():
	get_tree().change_scene("res://Scenes/levelSelector.tscn") # Replace with function body.
	

