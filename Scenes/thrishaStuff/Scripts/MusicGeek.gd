extends Area2D

onready var character = $AnimationPlayer

onready var sprite = $body

func _physics_process(_delta):
	character.play("Idle 2 Overworld")
	
var active = false
var initiateStrings = false
var letterDeliver = false

func _process(_delta):
	$QuestionMark.visible = active

func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("interact") and active:
			if(StoryVariables.isInitiateMainQuestDone == true):
				pause_game()
				var dialog = Dialogic.start("searchForStrings")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
				StoryVariables.isSearchForStringsDone = true
				StoryVariables.isInitiateMainQuestDone = false
				initiateStrings = true
			elif(StoryVariables.isDeliverLetterToLover == true):
				pause_game()
				var dialog = Dialogic.start("reportBackToMusicGeek")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
				StoryVariables.isReportBackToMusicGeek = true
				StoryVariables.isDeliverLetterToLover = false
				letterDeliver = true
			elif(StoryVariables.currentlyInChapterOne == true and initiateStrings == false and letterDeliver == false):
				#ch1 before main quest
				pause_game()
				var dialog = Dialogic.start("ch1_mgStrings")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
			elif(StoryVariables.currentlyInChapterOne == true and initiateStrings == true and letterDeliver == false):
				#ch1 before reporting back
				pause_game()
				var dialog = Dialogic.start("ch1_mgReport")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
			elif(StoryVariables.currentlyInChapterOne == true and letterDeliver == true):
				#ch1 after letter
				pause_game()
				var dialog = Dialogic.start("ch1_mgLetter")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
			elif(StoryVariables.currentlyInChapterTwo == true):
				#ch2 basic
				pause_game()
				var dialog = Dialogic.start("ch2_musicGeek")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
			elif(StoryVariables.currentlyInChapterThree == true):
				#ch3 basic
				pause_game()
				var dialog = Dialogic.start("ch3_musicGeek")
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

func _on_MusicGeek_body_entered(body):
	if body.name == 'player':
		active = true

func _on_MusicGeek_body_exited(body):
	if body.name == 'player':
		active = false
