extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var hid = true;

export var enable = true;

# Called when the node enters the scene tree for the first time.
func _ready():
	
	hide();
	pass # Replace with function body.


func _input(delta):
	
	if Input.is_action_just_pressed("menu") and !hid and enable:
		hide();
		hid = true;
	elif Input.is_action_just_pressed("menu") and hid and enable:
		show();
		hid = false;
		
	pass


func _on_Menu_pressed():
	
	get_tree().change_scene("res://Scenes/thrishaStuff/MainMenu.tscn");
	
	pass # Replace with function body.
