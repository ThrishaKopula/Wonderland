extends Control

func _on_MainMenu_pressed():
	Fade.change_scene("res://Scenes/thrishaStuff/MainMenu.tscn")
	yield(get_tree().create_timer(2), "timeout")

func _on_MainMenu_button_down():
	$ButtonClick.play()
