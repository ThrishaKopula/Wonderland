extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
var hold : bool = false;
export var color : int;

# Called when the node enters the scene tree for the first time.
func _ready():
	
	var rng = RandomNumberGenerator.new();
	rng.randomize();
	color = rng.randi_range(0, 2);
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	if hold:
		global_transform.origin = get_global_mouse_position();

		
	pass


func _on_RigidBody2D_input_event(viewport, event, shape_idx):
	
	if Input.is_action_just_pressed("click"):
		print("hold:", color);
		
		mode = RigidBody2D.MODE_STATIC;
		
		hold = true;
		
	elif Input.is_action_just_released("click"):
		
		
		print("not hold");
		hold = false;
		mode = RigidBody2D.MODE_RIGID;

	
	pass # Replace with function body.
