extends CanvasLayer


func _ready():
	pass


func _on_resume_button_up():
	$".".visible = false


func _on_options_button_up():
	$PopupDialog.popup()


func _on_exit_button_up():
	get_tree().free()
