extends Area2D

onready var character = $AnimationPlayer

onready var sprite = $body

func _physics_process(_delta):
	character.play("Idle 1 Overworld")

var active = false
var interactedCh1 = false
var interactedCh2 = false
var interactedCh3 = false

func _process(_delta):
	$QuestionMark.visible = active
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("interact") and active:
			if(StoryVariables.currentlyInChapterThree == true):
				#chapter 3 basic dialogue
				active = false
				interactedCh3 = true
				pause_game()
				var dialog = Dialogic.start("ch3_guard")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)

func pause_game():
	get_tree().paused = true
	StoryVariables.canPlayerMove = false
	
func unpause(timeline_name):
	get_tree().paused = false
	StoryVariables.canPlayerMove = true

func _on_Guard_body_entered(body):
	if body.name == 'player':
		active = true

func _on_Guard_body_exited(body):
	if body.name == 'player':
		active = false
