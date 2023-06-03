extends Node2D

var cheat = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_cheat_pressed():
	cheat = true;
	$"../cheat".disabled = true;
	pass # Replace with function body.
