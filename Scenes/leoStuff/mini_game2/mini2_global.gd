extends Node

var cheat = false;
var drink = preload("res://Scenes/leoStuff/mini_game2/drink.tscn");

var drink_onScene = false;

var red_pump = 0;
var green_pump = 0;
var blue_pump = 0;
var on_color = null;

var sending = false;

var win_R = 0;
var win_G = 0;
var win_B = 0;

# red = 1 green = 2 blue = 3
var cur_color = 0;

var correct_drink = 0;
		
func nextDrink():
	var rng = RandomNumberGenerator.new()
	rng.randomize();
	win_R = rng.randi_range(0, 4);
	win_G = rng.randi_range(0, 4);
	win_B = rng.randi_range(0, 4);
	
	pass
	
func check_win():
	
	if cheat:
		print("Cheat w");
		correct_drink += 1;
	elif red_pump == win_R and green_pump == win_G and blue_pump == win_B:
		
		print("W");
		correct_drink += 1;
		
	else:
		
		print("L");
	
	nextDrink();
	reset();
	
	if correct_drink == 5:
		if StoryVariables.miniGameToMainMenu:
			StoryVariables.miniGameToMainMenu = false;
			Fade.change_scene("res://Scenes/thrishaStuff/MainMenu.tscn");
		else:
			win();
	
	pass
	
func reset():
	
	red_pump = 0;
	green_pump = 0;
	blue_pump = 0;
	on_color = null;
	cur_color = 0;
	drink_onScene = false;
	
	pass

func win():
	get_tree().paused = false
	Fade.change_scene("res://Scenes/thrishaStuff/Locations/Wonderland/Tavern.tscn")
	yield(get_tree().create_timer(2), "timeout")
	StoryVariables.canPlayerMove = false
	var dialog = Dialogic.start("getBallerinaFromBartender");
	dialog.connect('timeline_end', self, 'unpause');
	add_child(dialog);
	StoryVariables.isGetBallerinaFromBartender = true
	pass

func unpause(timeline_name):
	get_tree().paused = false
	StoryVariables.canPlayerMove = true
		
