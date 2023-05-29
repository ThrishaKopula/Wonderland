extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ($TavernAudio.playing == false):
		$TavernAudio.play()
	if(StoryVariables.isInThiefGame == true and StoryVariables.catch_tavern == false):
		$Thief.show()
	else:
		$Thief.hide()

func _on_Thief_body_entered(body):
	StoryVariables.isInTavern = true

func _on_Thief_body_exited(body):
	StoryVariables.isInTavern = false
	StoryVariables.catch_tavern = true
	$Thief.hide()
