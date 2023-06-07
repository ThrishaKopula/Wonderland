extends Node2D


# Declare member variables here. Examples:
export var time = 100;
onready var timelabel = $Label;

var punish = false
var cheat = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if !punish:
		time = time - delta;
	
	timelabel.text ="Time: " + var2str(int(time));
	
	if int(time) % 5 == 0:
		
		for i in range(10):
			spawn();
	
	pass

func spawn():
	var rng = RandomNumberGenerator.new();
	rng.randomize();
	
	var trash = load("res://Scenes/leoStuff/mini_game4/trash.tscn");
	var trashs = trash.instance();
	trashs.position = Vector2(rng.randi_range(1500, 1750),100);
	
	$".".add_child(trashs);
	pass

func bad_call():
	
	time = time - 10;
	
	$AnimationPlayer.play("flash");


func _on_cheat_pressed():
	$cheat.disabled = true;
	cheat = true;
	$overall.get_node("AnimationPlayer").play("Purple Cookie");
	
	
	#yield($overall.get_node("AnimationPlayer"), "animation_finished");
	$"CleaningMiniGame-3".texture = load("res://Scenes/leoStuff/mini_game4/mini4Art/Cleaning_Mini_Game-4.png");
	
	pass # Replace with function body.
