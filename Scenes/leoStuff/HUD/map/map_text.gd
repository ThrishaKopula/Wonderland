extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var motion = Vector2();

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	$".".rect_position.x = get_viewport().get_mouse_position().x+10
	$".".rect_position.y = get_viewport().get_mouse_position().y+10
	
	pass
