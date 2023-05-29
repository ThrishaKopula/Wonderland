extends Control


var canAudioPlay = true

func checkAudio():
	if(canAudioPlay == true):
		$continueAudio.play()
	else:
		$continueAudio.stop()
		$continueAudio.playing == false

func _on_Continue_pressed():
	canAudioPlay = false
	checkAudio()
	var dialog = Dialogic.start("chapter3Start")
	add_child(dialog)
	yield(dialog, 'timeline_end')
	StoryVariables.isChapter3Start = true
	StoryVariables.currentlyInChapterThree = true
	get_tree().change_scene("res://Scenes/thrishaStuff/Locations/Overworld/Classroom.tscn")

func _on_Continue_button_down():
	$ButtonClick.play()

func _on_Main_Menu_pressed():
	get_tree().change_scene("res://Scenes/thrishaStuff/MainMenu.tscn")

func _on_Main_Menu_button_down():
	$ButtonClick.play()
