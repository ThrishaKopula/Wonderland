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
	
	if position.y < 600 and !Mini2Global.sending:
		position.y = 600;
	
	if hold and !Mini2Global.sending:
		position = get_global_mouse_position();
	else:
		if Mini2Global.on_color != null and !Mini2Global.sending:
			
			position = Mini2Global.on_color;
		
	scale = Vector2((position.y * 1.3)/750, (position.y * 1.3)/750);
	
	pass


func _on_drink_input_event(viewport, event, shape_idx):
	
	if Input.is_action_just_pressed("click") and !Mini2Global.sending:
		hold = true;
		print("up");
	elif Input.is_action_just_released("click") and !Mini2Global.sending:
		hold = false;
		print("down");
		if Mini2Global.cur_color != 0:
			
			if Mini2Global.cur_color == 5:
				
				Mini2Global.drink_onScene = false;
				Mini2Global.check_win();
				queue_free();
			
				
	
	pass # Replace with function body.
