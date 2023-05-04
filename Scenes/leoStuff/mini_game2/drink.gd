extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var hold = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	if hold:
		position = get_global_mouse_position();
	
	
	pass


func _on_drink_input_event(viewport, event, shape_idx):
	
	if Input.is_action_just_pressed("click"):
		hold = true;
		#print("up");
	elif Input.is_action_just_released("click"):
		hold = false;
		#print("down");
		if Mini2Global.cur_color != null:
			
			if Mini2Global.cur_color == 5:
				
				Mini2Global.drink_onScene = false;
				Mini2Global.check_win();
				queue_free();
			else:
				
				#print("let go");
				position = Mini2Global.on_color;
	
	pass # Replace with function body.
