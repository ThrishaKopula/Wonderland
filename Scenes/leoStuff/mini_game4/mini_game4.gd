extends Node2D


# Declare member variables here. Examples:
export var time : int  = 100 * 120;
onready var timelabel = $Label;

var punish = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if !punish:
		time = time - delta;
	
	timelabel.text ="Time: " + var2str(time/100);
	pass
	
func bad_call():
	
	time = time - 10 * 100;
	
	$AnimationPlayer.play("flash");
