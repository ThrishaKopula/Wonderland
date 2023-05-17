extends Area2D

var active = false

func _process(_delta):
	$QuestionMark.visible = active

func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("interact") and active:
			if(StoryVariables.isInTavern == true):
				pause_game()
				var dialog = Dialogic.start("testing")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
				StoryVariables.catch_tavern = true
			elif(StoryVariables.isInPlebTown == true):
				pause_game()
				var dialog = Dialogic.start("testing")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
				StoryVariables.catch_plebTown = true
			elif(StoryVariables.isInAristocratTown == true):
				pause_game()
				var dialog = Dialogic.start("thief_aristocratTown")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
				StoryVariables.catch_aristocratTown = true

func pause_game():
	get_tree().paused = true
	StoryVariables.canPlayerMove = false
	
func unpause(timeline_name):
	get_tree().paused = false
	StoryVariables.canPlayerMove = true
	active = false

func _on_Thief_body_entered(body):
	if body.name == 'player':
		active = true

func _on_Thief_body_exited(body):
	if body.name == 'player':
		active = false
