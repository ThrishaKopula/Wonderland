extends Control


func _process(delta):
	if($MenuAudio.playing == false):
		$MenuAudio.playing = true
		
func _on_returnButton_button_down():
	$ButtonClick.play()

func _on_returnButton_pressed():
	get_tree().change_scene("res://Scenes/thrishaStuff/MainMenu.tscn")

func _on_returnButton_mouse_entered():
	$return.scale = Vector2(1.1, 1.1)

func _on_returnButton_mouse_exited():
	$return.scale = Vector2(1, 1)
