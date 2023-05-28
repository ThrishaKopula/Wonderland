extends Node2D

var inChapter1End = false
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
	if(StoryVariables.isPrologueDone == false):
		$Marlon.hide()
	if(StoryVariables.isChapterOneStartDone == true or StoryVariables.isChapterTwoStart == true or StoryVariables.isChapter3Start == true):
		$Marlon.show()
		StoryVariables.isLeft = true
		StoryVariables.isRight = true
		StoryVariables.isMapInteracted = true
		StoryVariables.isAlisBedInteracted = true
		StoryVariables.isOtherBedInteracted = true
		StoryVariables.isMirrorInteracted = true
	if(StoryVariables.isGiveBallerinaToMatthew and inChapter1End == false):
		inChapter1End = true
		yield(get_tree().create_timer(2), "timeout")
		get_tree().paused = true
		StoryVariables.canPlayerMove = false
		var dialog = Dialogic.start("chapter1End")
		dialog.pause_mode = Node.PAUSE_MODE_PROCESS
		dialog.connect('timeline_end', self, 'unpauseContinueToChapter2')
		add_child(dialog)
		StoryVariables.isChapterOneDone = true
		StoryVariables.currentlyInChapterOne = false
		StoryVariables.isGiveBallerinaToMatthew = false

func unpauseContinueToChapter2(timeline_name):
	get_tree().paused = false
	Fade.change_scene("res://Scenes/thrishaStuff/ContinueToChapter2.tscn")
	yield(get_tree().create_timer(2), "timeout")
	StoryVariables.currentlyInChapterTwo = true



