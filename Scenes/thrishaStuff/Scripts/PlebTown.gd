extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ($PlebTownAudio.playing == false):
		$PlebTownAudio.play()
	pass
	
func _on_Thief_body_entered(body):
	StoryVariables.isInPlebTown = true


func _on_Thief_body_exited(body):
	StoryVariables.isInPlebTown = false
	$Thief.queue_free()
