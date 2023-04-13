extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
#func _ready():
#	var dialog = Dialogic.start("ifMapClicked")
#	add_child(dialog)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_map_pressed():
	var dialog = Dialogic.start("ifMapClicked")
	add_child(dialog)
