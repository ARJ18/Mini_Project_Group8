extends Node2D


#var stack_item = preload("res://Reusable Scenes/woodPlank.tscn")
export (PackedScene) var stack_item
onready var curr_item = get_node("woodPlank")
var stack = []
var top_color = "a900ff"
var balance = 3


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	stack.push_back(curr_item)
	curr_item.connect("mouse_signal",self,"fkk")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Balance.set_text("Balance: "+ str(balance))

func spawn_stack_item():
	var new_plank = stack_item.instance()
	add_child(new_plank)
	stack.push_back(new_plank)
	curr_item.modulate = Color.white
	new_plank.position.x =curr_item.position.x
	new_plank.position.y = curr_item.position.y - 73
	curr_item = new_plank
	curr_item.modulate = Color(top_color)

func _on_popButton_button_down():
	if stack.empty():
		print("Underflow")
	else:
		var popped = stack.pop_back()
		popped.queue_free()
		balance +=1
		if !stack.empty():
			curr_item=stack.back()
			curr_item.modulate = Color(top_color)
		$popSFX.play()


func _on_pushButton_pressed():
	print("Button Pushed")
	if balance!=0:
		balance-=1
		spawn_stack_item()
		$pushSFX.play()
	else:
		print("Overflow")

func _on_woodPlank_mouse_signal():
	print("Hello")

func fkk():
	print("Fkkk")
