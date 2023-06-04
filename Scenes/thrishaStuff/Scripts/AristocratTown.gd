extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ($AristocratTownAudio.playing == false):
		$AristocratTownAudio.play()
	if(StoryVariables.isInThiefGame == true and StoryVariables.catch_aristocratTown == false):
		$Thief.show()
	else:
		$Thief.hide()


func _on_Thief_body_entered(body):
	StoryVariables.isInAristocratTown = true


func _on_Thief_body_exited(body):
	StoryVariables.isInAristocratTown = false
	$Thief.hide()
