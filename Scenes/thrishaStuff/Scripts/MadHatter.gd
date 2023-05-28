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
				dialog.connect('timeline_end', self, 'unpauseToDormChapter1')
				add_child(dialog)
				StoryVariables.isGiveBallerinaToMatthew = true
			elif(StoryVariables.isAfterCleaningMinigame == true):
				pause_game()
				var dialog = Dialogic.start("/Chapter 2/deliverKeyToMatthew")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
				StoryVariables.isDeliverKeyToMatthew = true
				StoryVariables.isAfterCleaningMinigame == false
				StoryVariables.isChapterTwoDone = true
				StoryVariables.currentlyInChapterTwo = false

func pause_game():
	get_tree().paused = true
	StoryVariables.canPlayerMove = false
	
func unpause(timeline_name):
	get_tree().paused = false
	StoryVariables.canPlayerMove = true
	active = false

func unpauseToDormChapter1(timeline_name):
	active = false
	get_tree().paused = false
	Fade.change_scene("res://Scenes/thrishaStuff/Locations/Overworld/Dorm.tscn")
	yield(get_tree().create_timer(2), "timeout")

#	get_tree().paused = true
#	StoryVariables.canPlayerMove = false
#	var dialog = Dialogic.start("chapter1End")
#	dialog.pause_mode = Node.PAUSE_MODE_PROCESS
#	dialog.connect('timeline_end', self, 'unpauseContinueToChapter2')
#	add_child(dialog)
#	StoryVariables.isChapterOneDone = true

func unpauseContinueToChapter2(timeline_name):
	get_tree().paused = false
	Fade.change_scene("res://Scenes/thrishaStuff/ContinueToChapter2.tscn")
	yield(get_tree().create_timer(2), "timeout")
			
func _on_MadHatter_body_entered(body):
	if body.name == 'player':
		active = true

func _on_MadHatter_body_exited(body):
	if body.name == 'player':
		active = false
