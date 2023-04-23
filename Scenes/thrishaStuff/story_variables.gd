extends Node


# Declare member variables here. Examples:
var isMapInteracted = false
var isAlisBedInteracted = false
var isOtherBedInteracted = false
var isMirrorInteracted = false

# Main game checkpoints
var isPrologueDone = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func prologue_checkAllInteractions():
	if (isMapInteracted == true && isAlisBedInteracted == true && isOtherBedInteracted == true && isMirrorInteracted == true):
#		var dialog = Dialogic.start("movingInPart2")
		var dialog = Dialogic.start("testing")
		add_child(dialog)
		yield(dialog, 'timeline_end')
		isPrologueDone = true
