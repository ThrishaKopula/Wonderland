extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func win():
	if StoryVariables.miniGameToMainMenu:
		Fade.change_scene("res://Scenes/thrishaStuff/MainMenu.tscn");
	else:
		get_tree().paused = false;
		Fade.change_scene("res://Scenes/thrishaStuff/Locations/Wonderland/Courtyard.tscn");
		yield(get_tree().create_timer(2), "timeout");
		StoryVariables.canPlayerMove = false;
		var dialog = Dialogic.start("afterChapter3Minigame");
		dialog.connect('timeline_end', self, 'unpause');
		add_child(dialog);
		StoryVariables.isChapter3Minigame = true;
	pass

func unpause(timeline_name):
	get_tree().paused = false;
	StoryVariables.canPlayerMove = true;
