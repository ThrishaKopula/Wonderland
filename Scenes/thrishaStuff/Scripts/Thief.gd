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
			if(StoryVariables.currentlyInChapterTwo == true and StoryVariables.isInThiefGame == true and StoryVariables.isInTavern == true):
				pause_game()
				var dialog;
				match StoryVariables.catch_num:
					0:
						dialog = Dialogic.start("thief_catch1")
					1:
						dialog = Dialogic.start("thief_catch2")
					2:
						dialog = Dialogic.start("thief_catch3")
						StoryVariables.isCatchTheThief = true
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
				StoryVariables.catch_tavern = true
				StoryVariables.catch_num += 1
			elif(StoryVariables.currentlyInChapterTwo == true and StoryVariables.isInThiefGame == true and StoryVariables.isInPlebTown == true):
				pause_game()
				var dialog;
				match StoryVariables.catch_num:
					0:
						dialog = Dialogic.start("thief_catch1")
					1:
						dialog = Dialogic.start("thief_catch2")
					2:
						dialog = Dialogic.start("thief_catch3")
						StoryVariables.isCatchTheThief = true

				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
				StoryVariables.catch_num += 1
				StoryVariables.catch_plebTown = true
			elif(StoryVariables.currentlyInChapterTwo == true and StoryVariables.isInThiefGame == true and StoryVariables.isInAristocratTown == true):
				pause_game()
				var dialog;
				match StoryVariables.catch_num:
					0:
						dialog = Dialogic.start("thief_catch1")
					1:
						dialog = Dialogic.start("thief_catch2")
					2:
						dialog = Dialogic.start("thief_catch3")
						StoryVariables.isCatchTheThief = true

				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
				StoryVariables.catch_num += 1
				StoryVariables.catch_aristocratTown = true
		
func pause_game():
	get_tree().paused = true
	StoryVariables.canPlayerMove = false
	
func unpause(timeline_name):
	get_tree().paused = false
	StoryVariables.canPlayerMove = true
	active = false

func _on_Thief_body_entered(body):
	if body.name == 'player' and StoryVariables.isInThiefGame == true:
		active = true
	if(StoryVariables.isInPlebTown == true and StoryVariables.catch_plebTown == true):
		active = false
	if(StoryVariables.isInAristocratTown == true and StoryVariables.catch_aristocratTown == true):
		active = false
	if(StoryVariables.isInTavern == true and StoryVariables.catch_tavern == true):
		active = false
	

func _on_Thief_body_exited(body):
	if body.name == 'player':
		active = false
