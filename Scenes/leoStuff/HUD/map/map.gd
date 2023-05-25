extends CanvasLayer

var hid = true;
onready var text = $"name of place";
var change_text;

export var enable = true;

onready var trans = $"../trans/TransitionColor"

func _ready():
	trans.show();
	text.hide();
	change_text = text.get_child(0).get_child(0);
	trans.get_child(0).play("transition_out");
	hide();
	
	trans.get_child(0).play("transition_in");
	yield(trans.get_child(0), "animation_finished");
	trans.hide();
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(delta):
	
	if Input.is_action_just_pressed("map") and !hid and enable:
		hide();
		hid = true;
	elif Input.is_action_just_pressed("map") and hid and enable:
		show();
		hid = false;
	pass


func _on_Button_mouse_entered():
	print("in");
	change_text.text = "Dorm";
	text.show();
	pass # Replace with function body.

func _on_Button_mouse_exited():
	text.hide();
	pass # Replace with function body.

func _on_Button_hide():
	text.hide();
	pass # Replace with function body.
	
func _on_Button_pressed():
	trans.show();
	trans.get_child(0).play("transition_out");
	yield(trans.get_child(0), "animation_finished");
	
	get_tree().change_scene("res://Scenes/thrishaStuff/Locations/Overworld/Dorm.tscn");
	pass # Replace with function body.


func _on_Button2_mouse_entered():
	change_text.text = "Hallway";
	text.show();
	
	pass # Replace with function body.


func _on_Button2_mouse_exited():
	text.hide();
	pass # Replace with function body.


func _on_Button2_hide():
	text.hide();
	pass # Replace with function body.


func _on_Button2_pressed():
	
	
	
	get_tree().change_scene("res://Scenes/thrishaStuff/Locations/Overworld/Hallway.tscn");
	pass

func _on_music_pressed():
	#get_tree().change_scene();
	
	pass


func _on_music_mouse_entered():
	change_text.text = "music geek";
	text.show();
	pass


func _on_music_mouse_exited():
	text.hide();
	pass


func _on_music_hide():
	text.hide();
	pass # Replace with function body.


func _on_tavern_hide():
	text.hide();
	pass # Replace with function body.


func _on_tavern_pressed():
	get_tree().change_scene("res://Scenes/thrishaStuff/Locations/Wonderland/Tavern.tscn");
	pass # Replace with function body.


func _on_tavern_mouse_exited():
	text.hide();
	pass # Replace with function body.


func _on_tavern_mouse_entered():
	change_text.text = "tavern";
	text.show();
	pass # Replace with function body.
