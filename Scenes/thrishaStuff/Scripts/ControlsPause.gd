extends Control

func _on_returnButton_button_down():
	$ButtonClick.play()

func _on_returnButton_pressed():
	hide()

func _on_returnButton_mouse_entered():
	$return.scale = Vector2(1.1, 1.1)

func _on_returnButton_mouse_exited():
	$return.scale = Vector2(1, 1)
