extends Node2D


func _ready():
	$player.set_physics_process(false)


func _on_gohomeBtn_button_up():
	get_tree().change_scene("res://Scenes/levelSelector.tscn")
