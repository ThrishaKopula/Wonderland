extends Area2D

var active = false
var interacted = false
	
func _process(_delta):
	$QuestionMark.visible = active

func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("interact") and active:
			pause_game()
			var dialog = Dialogic.start("ifMapClicked")
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS
			dialog.connect('timeline_end', self, 'unpause')
			add_child(dialog)
			StoryVariables.isMapInteracted = true
			interacted = true

func pause_game():
	get_tree().paused = true
	StoryVariables.canPlayerMove = false
	
func unpause(timeline_name):
	get_tree().paused = false
	StoryVariables.canPlayerMove = true
	active = false
	$Map_Interactable.hide()
	StoryVariables.prologue_checkAllInteractions()
	

func _on_Map1_body_entered(body):
	if (body.name == 'player' and StoryVariables.isPrologueDone == false and interacted == false):
		active = true

func _on_Map1_body_exited(body):
	if (body.name == 'player' and StoryVariables.isPrologueDone == false):
		active = false
