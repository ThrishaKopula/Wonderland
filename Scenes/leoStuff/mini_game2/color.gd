extends Area2D


# Declare member variables here. Examples:
export var color = 0;


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _on_color_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	#print(color);
	Mini2Global.on_color = position + Vector2(0,-30);
	Mini2Global.cur_color = color;
	pass # Replace with function body.


func _on_color_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	#print("out");
	Mini2Global.on_color = null;
	Mini2Global.cur_color = 0;
	pass # Replace with function body.
