extends Area2D

onready var character = $AnimationPlayer

onready var sprite = $body

func _physics_process(_delta):
	character.play("Idle 2 Overworld")

var active = false

func _process(_delta):
	$QuestionMark.visible = active

func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("interact") and active:
			if(StoryVariables.currentlyInChapterOne and StoryVariables.isNerdQuestEnded == false):
				#side quest
				active = false
				pause_game()
				var dialog = Dialogic.start("nerd_sideQuest")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
				StoryVariables.isNerdQuestStarted = true
			if(StoryVariables.currentlyInChapterOne == true and StoryVariables.isNerdQuestEnded == true):
				#chapter 1 basic dialogue
				active = false
				pause_game()
				var dialog = Dialogic.start("ch1_nerd")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
			elif(StoryVariables.currentlyInChapterTwo == true):
				#chapter 2 basic dialogue
				active = false
				pause_game()
				var dialog = Dialogic.start("ch2_nerd")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
			elif(StoryVariables.currentlyInChapterThree == true):
				#chapter 3 basic dialogue
				active = false
				pause_game()
				var dialog = Dialogic.start("ch3_nerd")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)

func pause_game():
	get_tree().paused = true
	StoryVariables.canPlayerMove = false
	
func unpause(timeline_name):
	get_tree().paused = false
	StoryVariables.canPlayerMove = true
	
	if Dialogic.get_variable('nerdHelp') == "0":
		StoryVariables.isNerdQuestEnded = true
		StoryVariables.goodPoints += 1

func _on_Nerd_body_entered(body):
	if body.name == 'player':
		active = true

func _on_Nerd_body_exited(body):
	if body.name == 'player':
		active = false
