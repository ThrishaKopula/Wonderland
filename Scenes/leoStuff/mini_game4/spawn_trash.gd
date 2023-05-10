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
	
	var trash = load("res://Scenes/leoStuff/mini_game4/trash.tscn");
	var trashs = trash.instance();
	add_child(trashs);
	
	pass # Replace with function body.
