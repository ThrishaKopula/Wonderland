extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var drink = preload("res://Scenes/leoStuff/mini_game2/drink.tscn");

var drink_onScene = false;

var red_pump = 0;
var green_pump = 0;
var blue_pump = 0;
var yellow_pump = 0;
var on_color = null;

var win_R = 0;
var win_G = 0;
var win_B = 0;
var win_Y = 0;

# red = 1 green = 2 blue = 3 yellow = 4 checkWin = 5
var cur_color = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func check_win():
	
	
	if red_pump == win_R and green_pump == win_G and blue_pump == win_B and yellow_pump == win_Y:
		
		print("W");
	
	else:
		print("L");
	
	red_pump = 0;
	green_pump = 0;
	blue_pump = 0;
	yellow_pump = 0;
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass