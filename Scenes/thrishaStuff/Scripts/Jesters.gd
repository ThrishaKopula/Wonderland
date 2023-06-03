extends Area2D
	
var active = false
	
func _process(_delta):
	$QuestionMark.visible = active

func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("interact") and active:
			StoryVariables.chapter1_checkIfPlebItemsCollected()
			if(StoryVariables.isChapter3Start == true):
				pause_game()
				var dialog = Dialogic.start("rejectedByJesters")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
				StoryVariables.isRejectedByJesters = true
				StoryVariables.isChapter3Start = false
			elif(StoryVariables.isRejectedByJesters == true):
				pause_game()
				var dialog = Dialogic.start("/Chapter 3/eavesdropOnJesters")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
				StoryVariables.isEavesdropOnJesters = true
				StoryVariables.isRejectedByJesters = false
			elif(StoryVariables.isEavesdropOnJesters == true):
				pause_game()
				var dialog = Dialogic.start("/Chapter 3/initiateRoyalGiftsQuest")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
				StoryVariables.chapterThreeQuest = true
				StoryVariables.isInitiateRoyalGiftsQuest = true
				StoryVariables.isEavesdropOnJesters = false
			elif(StoryVariables.isAllRoyalItemsCollected == true):
				pause_game()
				var dialog = Dialogic.start("/Chapter 3/deliverGiftsToJesters")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
				StoryVariables.isDeliverGiftsToJesters = true
				StoryVariables.chapterThreeQuest = false
				StoryVariables.isAllRoyalItemsCollected = false
			elif(StoryVariables.currentlyInChapterOne == true):
				#ch1 before/after quest
				pause_game()
				var dialog = Dialogic.start("ch1_jesters")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
			elif(StoryVariables.currentlyInChapterTwo == true):
				#ch2 before/after quest
				pause_game()
				var dialog = Dialogic.start("ch2_jesters")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
			elif(StoryVariables.chapterThreeQuest == true and StoryVariables.isAllRoyalItemsCollected == false and StoryVariables.isChapter3Start == false and StoryVariables.isRejectedByJesters == false and StoryVariables.isEavesdropOnJesters == false):
				#ch3 during quest
				pause_game()
				var dialog = Dialogic.start("ch3_jestersQuest")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
			
func pause_game():
	get_tree().paused = true
	StoryVariables.canPlayerMove = false
	
func unpause(timeline_name):
	get_tree().paused = false
	StoryVariables.canPlayerMove = true
	active = false


func _on_Jesters_body_entered(body):
	if body.name == 'player':
		active = true

func _on_Jesters_body_exited(body):
	if body.name == 'player':
		active = false
