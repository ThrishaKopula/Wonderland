extends Area2D

var active = false
	
func _process(_delta):
	$QuestionMark.visible = active

func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("interact") and active:
			if(StoryVariables.isInitiateRoyalGiftsQuest == true):
				pause_game()
				var dialog = Dialogic.start("spade")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
				StoryVariables.spadeItem = true
				
			
func pause_game():
	get_tree().paused = true
	StoryVariables.canPlayerMove = false
	
func unpause(timeline_name):
	get_tree().paused = false
	StoryVariables.canPlayerMove = true
	active = false
	StoryVariables.chapter3_checkJesterItems()
	hide()

func _on_Spade_body_entered(body):
	if (body.name == 'player' and StoryVariables.isInitiateRoyalGiftsQuest == true and StoryVariables.spadeItem == false):
		active = true

func _on_Spade_body_exited(body):
	if (body.name == 'player' and StoryVariables.isInitiateRoyalGiftsQuest == true):
		active = false
