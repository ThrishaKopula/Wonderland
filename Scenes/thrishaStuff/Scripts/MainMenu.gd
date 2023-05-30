extends Control

var canAudioPlay = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func checkAudio():
	if(canAudioPlay == true):
		$MenuAudio.play()
	else:
		$MenuAudio.stop()
		$MenuAudio.playing == false
		
func _on_StartButton_pressed():
	canAudioPlay = false
	checkAudio()
	var dialog = Dialogic.start("testing")
	add_child(dialog)
	yield(dialog, 'timeline_end')
	get_tree().change_scene("res://Scenes/thrishaStuff/Locations/Overworld/Dorm.tscn")

func _on_Quit_pressed():
	get_tree().quit()

func _on_Credits_pressed():
	pass # Replace with function body.

func _on_StartButton_button_down():
	$ButtonClick.play()

func _on_Options_button_down():
	$ButtonClick.play()

func _on_Quit_button_down():
	$ButtonClick.play()

func _on_Credits_button_down():
	$ButtonClick.play()
	
func _on_Prologue_pressed():
	canAudioPlay = false
	checkAudio()
	var dialog = Dialogic.start("movingIn")
	add_child(dialog)
	yield(dialog, 'timeline_end')
	get_tree().change_scene("res://Scenes/thrishaStuff/Locations/Overworld/Dorm.tscn")

func _on_Prologue_button_down():
	$ButtonClick.play()
	
func _on_Chapter_1_pressed():
	canAudioPlay = false
	checkAudio()
	var dialog = Dialogic.start("chapter1Start")
	add_child(dialog)
	yield(dialog, 'timeline_end')
	StoryVariables.isChapterOneStartDone = true
	StoryVariables.currentlyInChapterOne = true
	get_tree().change_scene("res://Scenes/thrishaStuff/Locations/Overworld/Classroom.tscn")

func _on_Chapter_1_button_down():
	$ButtonClick.play()

func _on_Chapter_2_pressed():
	canAudioPlay = false
	checkAudio()
	var dialog = Dialogic.start("chapter2Start")
	add_child(dialog)
	yield(dialog, 'timeline_end')
	StoryVariables.isChapterTwoStart = true
	StoryVariables.currentlyInChapterTwo = true
	get_tree().change_scene("res://Scenes/thrishaStuff/Locations/Overworld/Classroom.tscn")
	
func _on_Chapter_2_button_down():
	$ButtonClick.play()

func _on_Chapter_3_button_down():
	$ButtonClick.play()

func _on_Chapter_3_pressed():
	canAudioPlay = false
	checkAudio()
	var dialog = Dialogic.start("chapter3Start")
	add_child(dialog)
	yield(dialog, 'timeline_end')
	StoryVariables.isChapter3Start = true
	StoryVariables.currentlyInChapterThree = true
	get_tree().change_scene("res://Scenes/thrishaStuff/Locations/Overworld/Classroom.tscn")
