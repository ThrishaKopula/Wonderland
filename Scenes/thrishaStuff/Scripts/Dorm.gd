extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var isLeftPressed = false
var isRightPressed = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ($DormAudio.playing == false):
		$DormAudio.play()
	if Input.is_action_pressed("move_left"):
		StoryVariables.isLeft = true
		$player/MoveLeft.hide()
	if Input.is_action_pressed("move_right"):
		StoryVariables.isRight = true
		$player/MoveRight.hide()
	if(StoryVariables.isLeft == true and StoryVariables.isRight == true):
		$player/MoveLeft.hide()
		$player/MoveRight.hide()
	
		
	
