extends Area2D

onready var character = $AnimationPlayer

onready var sprite = $body

func _physics_process(_delta):
	character.play("Idle 2 Overworld")

var active = false
var interactedCh1 = false
var interactedCh2 = false
var interactedCh3 = false

func _process(_delta):
	$QuestionMark.visible = active
	if(interactedCh1 == true and StoryVariables.currentlyInChapterOne):
		$QuestionMark.texture = StoryVariables.basicTalked
	if(interactedCh2 == true and StoryVariables.currentlyInChapterTwo):
		$QuestionMark.texture = StoryVariables.basicTalked
	if(interactedCh3 == true and StoryVariables.currentlyInChapterThree):
		$QuestionMark.texture = StoryVariables.basicTalked
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("interact") and active:
			if(StoryVariables.currentlyInChapterTwo and StoryVariables.isMayorQuestEnded == false):
				#side quest
				active = false
				pause_game()
				var dialog = Dialogic.start("mayor_sideQuest")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
				StoryVariables.isMayorQuestStarted = true
			if(StoryVariables.currentlyInChapterOne == true):
				#chapter 1 basic dialogue
				interactedCh1 = true
				active = false
				pause_game()
				var dialog = Dialogic.start("ch1_mayor")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
			elif(StoryVariables.currentlyInChapterTwo == true and StoryVariables.isMayorQuestEnded == true):
				#chapter 2 basic dialogue
				interactedCh2 = true
				active = false
				pause_game()
				var dialog = Dialogic.start("ch2_mayor")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
			elif(StoryVariables.currentlyInChapterThree == true):
				#chapter 3 basic dialogue
				interactedCh3 = true
				active = false
				pause_game()
				var dialog = Dialogic.start("ch3_mayor")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)

func pause_game():
	get_tree().paused = true
	StoryVariables.canPlayerMove = false
	
func unpause(timeline_name):
	get_tree().paused = false
	StoryVariables.canPlayerMove = true
	
	if Dialogic.get_variable('mayorHelp') == "0":
		StoryVariables.isMayorQuestEnded = true
		StoryVariables.goodPoints += 1

func _on_Mayor_body_entered(body):
	if body.name == 'player':
		active = true

func _on_Mayor_body_exited(body):
	if body.name == 'player':
		active = false
