extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_StartButton_pressed():
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
	var dialog = Dialogic.start("movingIn")
#	var dialog = Dialogic.start("afterMiniGame")
	add_child(dialog)
	yield(dialog, 'timeline_end')
	get_tree().change_scene("res://Scenes/thrishaStuff/Locations/Overworld/Dorm.tscn")

func _on_Prologue_button_down():
	$ButtonClick.play()
	
func _on_Chapter_1_pressed():
	var dialog = Dialogic.start("chapter1Start")
	add_child(dialog)
	yield(dialog, 'timeline_end')
	StoryVariables.isChapterOneStartDone = true
	get_tree().change_scene("res://Scenes/thrishaStuff/Locations/Overworld/Classroom.tscn")

func _on_Chapter_1_button_down():
	$ButtonClick.play()




func _on_Chapter_2_pressed():
	var dialog = Dialogic.start("chapter2Start")
	add_child(dialog)
	yield(dialog, 'timeline_end')
	StoryVariables.isChapterTwoStart = true
	get_tree().change_scene("res://Scenes/thrishaStuff/Locations/Overworld/Classroom.tscn")


func _on_Chapter_2_button_down():
	$ButtonClick.play()
