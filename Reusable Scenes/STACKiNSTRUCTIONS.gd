extends WindowDialog

signal ready_to_play()
var curr_tab = 0
func _ready():
	pass

func _on_VideoPlayer_finished():
	$TabContainer/Select/VideoPlayer.play()

func _on_NextSLide_button_up():
	$TabContainer.current_tab += 1

func _on_Next_button_up():
	$TabContainer.current_tab += 1

func _on_previous_button_up():
	$TabContainer.current_tab -= 1

func _on_Button_button_up():
	$TabContainer.current_tab -= 1


func _on_Button2_button_up():
	$TabContainer.current_tab += 1

func _on_playbtn_button_up():
	$".".visible = false
	emit_signal("ready_to_play")

func _on_Movement_tab_clicked(tab):
	curr_tab = 0
	print(tab)

func _on_Select_tab_clicked(tab):
	curr_tab = 1

func _on_Actions_tab_clicked(tab):
	curr_tab = 2

func _on_Goal_tab_clicked(tab):
	curr_tab = 3

func _on_STACKiNSTRUCTIONS_popup_hide():
	emit_signal("ready_to_play")

func _on_ActionsVideoPlayer_finished():
	$TabContainer/Actions/ActionsVideoPlayer.play()
