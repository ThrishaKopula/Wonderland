extends Button

func _on_mirror_pressed():
	var dialog = Dialogic.start("ifMirrorClicked")
	add_child(dialog)
