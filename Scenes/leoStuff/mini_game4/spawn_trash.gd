extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	
	var rng = RandomNumberGenerator.new();
	rng.randomize();
	
	
	var trash = load("res://Scenes/leoStuff/mini_game4/trash.tscn");
	var trashs = trash.instance();
	trashs.position = Vector2(rng.randi_range(1500, 1750),100);
	
	$"..".add_child(trashs);
	
	pass # Replace with function body.

