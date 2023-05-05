extends Area2D

var active = false

func _process(_delta):
	$QuestionMark.visible = active

func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("interact") and active:
			if(StoryVariables.isSearchForStringsDone == true):
				pause_game()
				var dialog = Dialogic.start("deliverLetterToLover")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
				StoryVariables.isDeliverLetterToLover = true
				StoryVariables.isSearchForStringsDone = false

func pause_game():
	get_tree().paused = true
	StoryVariables.canPlayerMove = false
	
func unpause(timeline_name):
	get_tree().paused = false
	StoryVariables.canPlayerMove = true
	active = false

func _on_Cheerleader_body_entered(body):
	if body.name == 'player':
		active = true

func _on_Cheerleader_body_exited(body):
	if body.name == 'player':
		active = false
