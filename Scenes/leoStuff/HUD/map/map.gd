extends CanvasLayer

var hid = true
onready var text = $"name of place"
var change_text
# Called when the node enters the scene tree for the first time.
func _ready():
	text.hide()
	change_text = text.get_child(0).get_child(0)
	hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_action_just_pressed("map") and !hid:
		hide()
		hid = true
	elif Input.is_action_just_pressed("map") and hid:
		show()
		hid = false
	pass


func _on_Button_mouse_entered():
	print("in")
	change_text.text = "Dorm"
	text.show()
	pass # Replace with function body.

func _on_Button_mouse_exited():
	text.hide()
	pass # Replace with function body.

func _on_Button_hide():
	text.hide()
	pass # Replace with function body.
	
func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/thrishaStuff/Locations/Dorm.tscn");
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
	get_tree().change_scene("res://Scenes/thrishaStuff/Locations/Hallway.tscn");
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
	get_tree().change_scene("res://Scenes/thrishaStuff/Locations/Tavern.tscn");
	pass # Replace with function body.


func _on_tavern_mouse_exited():
	text.hide();
	pass # Replace with function body.


func _on_tavern_mouse_entered():
	change_text.text = "tavern";
	text.show();
	pass # Replace with function body.
