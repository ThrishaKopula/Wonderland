extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_dispense_input_event(viewport, event, shape_idx):
	
	if Input.is_action_just_pressed("click"):
		
		match Mini2Global.cur_color:
			
			1:
				Mini2Global.red_pump += 1;
			2:
				Mini2Global.green_pump += 1;
			3:
				Mini2Global.blue_pump += 1;
			4:
				Mini2Global.yellow_pump += 1;
				
		print(Mini2Global.red_pump);
		print(Mini2Global.green_pump);
		print(Mini2Global.blue_pump);
		print(Mini2Global.yellow_pump);
	
	
	
	pass # Replace with function body.
