extends Area2D

onready var character = $AnimationPlayer

onready var sprite = $body

func _physics_process(_delta):
	character.play("Idle 1 Overworld")
	
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
				StoryVariables.isInitiateCh2MainQuest = false
			elif(StoryVariables.isBringThiefToVendors == true):
				pause_game()
				var dialog = Dialogic.start("/Chapter 2/deliverExoticFruitToLunchLady")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
				StoryVariables.isDeliverExoticFruitToLunchLady = true
				StoryVariables.isBringThiefToVendors = false
			elif(StoryVariables.currentlyInChapterOne == true):
				#ch1 basic
				pause_game()
				var dialog = Dialogic.start("ch1_lunchlady")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
			elif(StoryVariables.chapterTwoQuest == true and StoryVariables.isInitiateCh2MainQuest == false and StoryVariables.isBringThiefToVendors == false):
				#ch2 during quest
				pause_game()
				var dialog = Dialogic.start("ch2_lunchladyQuest")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
			elif(StoryVariables.chapterTwoQuest == false and StoryVariables.isInitiateCh2MainQuest == false and StoryVariables.isBringThiefToVendors == false):
				#ch2 before/after quest
				pause_game()
				var dialog = Dialogic.start("ch2_lunchladyNoQuest")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
			elif(StoryVariables.currentlyInChapterThree == true):
				#ch3 basic
				pause_game()
				var dialog = Dialogic.start("ch3_lunchlady")
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

func _on_LunchLady_body_entered(body):
	if body.name == 'player':
		active = true

func _on_LunchLady_body_exited(body):
	if body.name == 'player':
		active = false
