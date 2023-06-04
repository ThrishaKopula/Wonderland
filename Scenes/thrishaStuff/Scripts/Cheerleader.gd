extends Area2D

onready var character = $AnimationPlayer

onready var sprite = $body

func _physics_process(_delta):
	character.play("Idle 3 Overworld")
	
var active = false

func _process(_delta):
	$QuestionMark.visible = active

func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("interact") and active:
			if(StoryVariables.currentlyInChapterOne == true and StoryVariables.isSearchForStringsDone == false):
				#ch1 
				active = false
				pause_game()
				var dialog = Dialogic.start("ch1_cheerleader")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
			if(StoryVariables.isSearchForStringsDone == true):
				active = false
				pause_game()
				var dialog = Dialogic.start("deliverLetterToLover")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
				StoryVariables.isDeliverLetterToLover = true
				StoryVariables.isSearchForStringsDone = false
			if(StoryVariables.currentlyInChapterTwo == true):
				#ch2
				active = false
				pause_game()
				var dialog = Dialogic.start("ch2_cheerleader")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
			if(StoryVariables.currentlyInChapterThree == true):
				#ch3
				active = false
				pause_game()
				var dialog = Dialogic.start("ch3_cheerleader")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
			

func pause_game():
	get_tree().paused = true
	StoryVariables.canPlayerMove = false
	
func unpause(timeline_name):
	get_tree().paused = false
	StoryVariables.canPlayerMove = true
	

func _on_Cheerleader_body_entered(body):
	if body.name == 'player':
		active = true

func _on_Cheerleader_body_exited(body):
	if body.name == 'player':
		active = false
