extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var hid = true

# Called when the node enters the scene tree for the first time.
func _ready():
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
	print("lol")
	pass # Replace with function body.

func _on_Button_mouse_exited():
	print("lol out")
	pass # Replace with function body.

func _on_Button_hide():
	print("lol out")
	pass # Replace with function body.


func _on_Button2_mouse_entered():
	print("lol2")
	pass # Replace with function body.

