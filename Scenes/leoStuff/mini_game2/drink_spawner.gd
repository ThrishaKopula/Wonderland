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


func _on_drink_spawner_input_event(viewport, event, shape_idx):
	
	if Input.is_action_just_pressed("click") and not Mini2Global.drink_onScene:
		var drink = load("res://Scenes/leoStuff/mini_game2/drink.tscn").instance();
		get_parent().add_child(drink);
		
		drink.position = position + Vector2(0,-150);
		
		Mini2Global.drink_onScene = true;
	
	pass # Replace with function body.
