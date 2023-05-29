extends Area2D

var active = false

func _process(_delta):
	$QuestionMark.visible = active

func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("interact") and active:
			if(StoryVariables.isChapterTwoStart == true):
				print(StoryVariables.isChapterTwoStart)
				pause_game()
				var dialog = Dialogic.start("initiateCh2MainQuest")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
				StoryVariables.isInitiateCh2MainQuest = true
				StoryVariables.isChapterTwoStart = false
			elif(StoryVariables.isDeliverExoticFruitToLunchLady == true):
				pause_game()
				var dialog = Dialogic.start("/Chapter 2/deliverToJanitor")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'miniGameUnpause')
				add_child(dialog)
				StoryVariables.isDeliverToJanitor = true
				StoryVariables.isDeliverExoticFruitToLunchLady == false

func pause_game():
	get_tree().paused = true
	StoryVariables.canPlayerMove = false
	
func unpause(timeline_name):
	get_tree().paused = false
	StoryVariables.canPlayerMove = true
	active = false

func miniGameUnpause(timeline_name):
	get_tree().paused = false
	StoryVariables.canPlayerMove = true
	active = false
	get_tree().change_scene("res://Scenes/leoStuff/mini_game4/mini_game4.tscn")

func _on_Janitor_body_entered(body):
	if body.name == 'player':
		active = true

func _on_Janitor_body_exited(body):
	if body.name == 'player':
		active = false
