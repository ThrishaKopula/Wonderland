extends Area2D

var active = false

func _process(_delta):
	$QuestionMark.visible = active

func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("interact") and active:
			if(StoryVariables.isGetBallerinaFromBartender == true):
				active = false
				pause_game()
				var dialog = Dialogic.start("/Chapter 1/giveBallerinaToMatthew")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpauseToDorm')
				add_child(dialog)
				StoryVariables.isGiveBallerinaToMatthew = true
			elif(StoryVariables.isAfterCleaningMinigame == true):
				active = false
				pause_game()
				var dialog = Dialogic.start("/Chapter 2/deliverKeyToMatthew")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpauseToDorm')
				add_child(dialog)
				StoryVariables.isDeliverKeyToMatthew = true
			elif(StoryVariables.currentlyInChapterOne == true and StoryVariables.chapterOneQuest == true and StoryVariables.isGetBallerinaFromBartender == false):
				#chapter 1 during quest
				active = false
				pause_game()
				var dialog = Dialogic.start("ch1_matthewQuest")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
			elif(StoryVariables.currentlyInChapterOne == true and StoryVariables.chapterOneQuest == false and StoryVariables.isGetBallerinaFromBartender == false):
				#chapter 1 before/after quest
				active = false
				pause_game()
				var dialog = Dialogic.start("ch1_matthewNoQuest")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
			elif(StoryVariables.currentlyInChapterTwo == true and StoryVariables.chapterTwoQuest == true and StoryVariables.isAfterCleaningMinigame == false):
				#chapter 2 during quest
				active = false
				pause_game()
				var dialog = Dialogic.start("ch2_matthewQuest")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
			elif(StoryVariables.currentlyInChapterTwo == true and StoryVariables.chapterTwoQuest == false and StoryVariables.isAfterCleaningMinigame == false):
				#chapter 2 before/after quest
				active = false
				pause_game()
				var dialog = Dialogic.start("ch2_matthewNoQuest")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
			elif(StoryVariables.currentlyInChapterThree == true and StoryVariables.chapterThreeQuest == true):
				#chapter 3 before/after quest
				active = false
				pause_game()
				var dialog = Dialogic.start("ch3_matthewQuest")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
			elif(StoryVariables.currentlyInChapterThree == true and StoryVariables.chapterThreeQuest == false):
				#chapter 3 before/after quest
				active = false
				pause_game()
				var dialog = Dialogic.start("ch3_matthewNoQuest")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)

func pause_game():
	get_tree().paused = true
	StoryVariables.canPlayerMove = false
	
func unpause(timeline_name):
	get_tree().paused = false
	StoryVariables.canPlayerMove = true

func unpauseToDorm(timeline_name):
	StoryVariables.dormDay = false
	active = false
	get_tree().paused = false
	Fade.change_scene("res://Scenes/thrishaStuff/Locations/Overworld/Dorm.tscn")
	yield(get_tree().create_timer(2), "timeout")

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
