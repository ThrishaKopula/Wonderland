extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var hid = true;

export var enable = true;

# Called when the node enters the scene tree for the first time.
func _ready():
	
	hide();
	$controlSprite.hide();
#	$back.hide();
	$return.hide()
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
	StoryVariables.resetVariables()
	get_tree().change_scene("res://Scenes/thrishaStuff/MainMenu.tscn");
	
	pass # Replace with function body.

func _on_control_pressed():
	$controlSprite.show();
	$back.show();
	$return.show()
	$VBoxContainer.hide()
	pass # Replace with function body.

func _on_control_mouse_entered():
	$VBoxContainer/control.rect_scale = Vector2(1.1, 1.1)

func _on_control_mouse_exited():
	$VBoxContainer/control.rect_scale = Vector2(1, 1)

func _on_Menu_mouse_entered():
	$VBoxContainer/Menu.rect_scale = Vector2(1.1, 1.1)

func _on_Menu_mouse_exited():
	$VBoxContainer/Menu.rect_scale = Vector2(1, 1)


func _on_returnButton_pressed():
	$controlSprite.hide();
	$back.hide();
	$return.hide()
	$VBoxContainer.show()
	$return.scale = Vector2(1, 1)

func _on_returnButton_mouse_entered():
	$return.scale = Vector2(1.1, 1.1)

func _on_returnButton_mouse_exited():
	$return.scale = Vector2(1, 1)
