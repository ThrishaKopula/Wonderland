extends Area2D

var active = false

func _process(_delta):
	$QuestionMark.visible = active

func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("interact") and active:
			if(StoryVariables.isInitiateCh2MainQuest == true):
				pause_game()
				var dialog = Dialogic.start("findWhoIsCloseToJanitor")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
				StoryVariables.isFindWhoIsCloseToJanitor = true
				StoryVariables.isInitiateCh2MainQuest == false
			elif(StoryVariables.isBringThiefToVendors == true):
				pause_game()
				var dialog = Dialogic.start("/Chapter 2/deliverExoticFruitToLunchLady")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
				StoryVariables.isDeliverExoticFruitToLunchLady = true
				StoryVariables.isBringThiefToVendors == false

func pause_game():
	get_tree().paused = true
	StoryVariables.canPlayerMove = false
	
func unpause(timeline_name):
	get_tree().paused = false
	StoryVariables.canPlayerMove = true
	active = false

func _on_LunchLady_body_entered(body):
	if body.name == 'player':
		active = true

func _on_LunchLady_body_exited(body):
	if body.name == 'player':
		active = false
