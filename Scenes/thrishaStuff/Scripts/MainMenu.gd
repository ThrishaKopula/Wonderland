extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_StartButton_pressed():
#	var dialog = Dialogic.start("movingIn")
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
