extends Node2D


# Declare member variables here. Examples:
export var time = 101;
onready var timelabel = $Label;


var cheat = false;
var once = true;

var trashNum = 50;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if trashNum <= 0:
		$winLogo/AnimationPlayer.play("win");
		yield($winLogo/AnimationPlayer,"animation_finished");
		
		
	if time > 0:
		time = time - delta;
		timelabel.text = var2str(int(time));
	else:
		
		timelabel.text = "0";
		$winLogo/AnimationPlayer.play("lose");
		yield($winLogo/AnimationPlayer,"animation_finished");
	
	
	if int(time) % 5 == 0 and once:
		once = false;
		for i in range(5):
			spawn();
			yield(get_tree().create_timer(.5), "timeout");
	elif int(time) % 5 != 0 and !once:
		once = true;
		
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
	
	StoryVariables.badPoints += 1;
	
	$cheat.disabled = true;
	cheat = true;
	$overall.get_node("AnimationPlayer").play("Purple Cookie");
	$can.queue_free();
	$can1.queue_free();
	$can2.queue_free();
	$can3.position = Vector2(670,520);
	#yield($overall.get_node("AnimationPlayer"), "animation_finished");
	$cans.texture = load("res://Scenes/leoStuff/mini_game4/mini4Art/big.png");
	
	pass # Replace with function body.
