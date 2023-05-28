extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Continue_pressed():
	var dialog = Dialogic.start("chapter2Start")
	add_child(dialog)
	yield(dialog, 'timeline_end')
	StoryVariables.isChapterTwoStart = true
	StoryVariables.currentlyInChapterTwo = true
	get_tree().change_scene("res://Scenes/thrishaStuff/Locations/Overworld/Classroom.tscn")

func _on_Continue_button_down():
	$ButtonClick.play()

func _on_Main_Menu_pressed():
	get_tree().change_scene("res://Scenes/thrishaStuff/MainMenu.tscn")

func _on_Main_Menu_button_down():
	$ButtonClick.play()
