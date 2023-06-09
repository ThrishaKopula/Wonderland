extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func win():
	if StoryVariables.miniGameToMainMenu:
		StoryVariables.miniGameToMainMenu = false;
		Fade.change_scene("res://Scenes/thrishaStuff/MainMenu.tscn");
	else:
		get_tree().paused = false;
		Fade.change_scene("res://Scenes/thrishaStuff/Locations/Overworld/Hallway.tscn");
		yield(get_tree().create_timer(2), "timeout");
		StoryVariables.canPlayerMove = false;
		var dialog = Dialogic.start("afterCleaningMinigame");
		dialog.connect('timeline_end', self, 'unpause');
		add_child(dialog);
		StoryVariables.isAfterCleaningMinigame = true;
	pass

func unpause(timeline_name):
	get_tree().paused = false;
	StoryVariables.canPlayerMove = true;
