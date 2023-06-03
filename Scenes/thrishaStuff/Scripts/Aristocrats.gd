extends Area2D


var active = false

func _process(_delta):
	$QuestionMark.visible = active
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("interact") and active:
			if(StoryVariables.currentlyInChapterOne == true):
				#chapter 1 basic dialogue
				pause_game()
				var dialog = Dialogic.start("ch1_aristocrats")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
			elif(StoryVariables.currentlyInChapterTwo == true):
				#chapter 2 basic dialogue
				pause_game()
				var dialog = Dialogic.start("ch2_aristocrats")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
			elif(StoryVariables.currentlyInChapterThree == true):
				#chapter 3 basic dialogue
				pause_game()
				var dialog = Dialogic.start("ch3_aristocrats")
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

func _on_Aristocrats_body_entered(body):
	if body.name == 'player':
		active = true

func _on_Aristocrats_body_exited(body):
	if body.name == 'player':
		active = false
