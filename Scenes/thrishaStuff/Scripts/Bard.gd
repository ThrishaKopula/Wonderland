extends Area2D

var active = false

# Called when the node enters the scene tree for the first time.
#func _ready():
#	connect("body_entered", self, "_on_Bed_body_entered")
#	connect("body_exited", self, "_on_Bed_body_exited")
	
func _process(_delta):
	$QuestionMark.visible = active

func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("interact") and active:
			if(StoryVariables.isPrologueDone == true):
				pause_game()
				var dialog = Dialogic.start("initiateMainQuest")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
				StoryVariables.isInitiateMainQuestDone = true
				StoryVariables.isPrologueDone = false
			elif(StoryVariables.isReportBackToMusicGeek == true):
				pause_game()
				var dialog = Dialogic.start("deliverStringsToBard")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
				StoryVariables.isDeliverStringsToBard = true
				StoryVariables.isReportBackToMusicGeek = false
			elif(StoryVariables.isCollectOtherworldlyItems == true):
				pause_game()
				var dialog = Dialogic.start("bringIngredientsToTavern")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'miniGameUnpause')
				add_child(dialog)
				StoryVariables.isBringIngredientsToTavern = true
				StoryVariables.isCollectOtherworldlyItems = false

func pause_game():
	get_tree().paused = true
	StoryVariables.canPlayerMove = false
	
	
func miniGameUnpause(timeline_name):
	get_tree().paused = false
	StoryVariables.canPlayerMove = true
	active = false
	get_tree().change_scene("res://Scenes/leoStuff/mini_game2/mini_game2.tscn")
	
	
func unpause(timeline_name):
	get_tree().paused = false
	StoryVariables.canPlayerMove = true
	active = false

func _on_Bard_body_entered(body):
	if body.name == 'player':
		active = true

func _on_Bard_body_exited(body):
	if body.name == 'player':
		active = false
