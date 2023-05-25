extends Area2D

var active = false

func _process(_delta):
	$QuestionMark.visible = active

func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("interact") and active:
			if(StoryVariables.isGetBallerinaFromBartender == true):
				pause_game()
				var dialog = Dialogic.start("/Chapter 1/giveBallerinaToMatthew")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
				StoryVariables.isGiveBallerinaToMatthew = true
				StoryVariables.isChapterOneDone = true
			elif(StoryVariables.isAfterCleaningMinigame == true):
				pause_game()
				var dialog = Dialogic.start("/Chapter 2/deliverKeyToMatthew")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
				StoryVariables.isDeliverKeyToMatthew = true
				StoryVariables.isAfterCleaningMinigame == false
				StoryVariables.isChapterTwoDone = true

func pause_game():
	get_tree().paused = true
	StoryVariables.canPlayerMove = false
	
func unpause(timeline_name):
	get_tree().paused = false
	StoryVariables.canPlayerMove = true
	active = false
			
func _on_MadHatter_body_entered(body):
	if body.name == 'player':
		active = true

func _on_MadHatter_body_exited(body):
	if body.name == 'player':
		active = false
