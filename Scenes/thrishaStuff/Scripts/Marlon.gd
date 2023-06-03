extends Area2D

var basic = preload("res://Scenes/thrishaStuff/images/speech_bubbles/Speech_Bubble_-2.png")
var basicTalked = preload("res://Scenes/thrishaStuff/images/speech_bubbles/Speech_Bubble_-1.png")
var quest = preload("res://Scenes/thrishaStuff/images/speech_bubbles/Speech_Bubble_-3.png")

var interactedCh1 = false
var interactedCh2 = false
var interactedCh3 = false

onready var character = $AnimationPlayer

onready var sprite = $body

export var inOverworld = true


var rng = 0
var rngg = RandomNumberGenerator.new()

var active = false

func _process(_delta):
	$QuestionMark.visible = active
	if(interactedCh1 == true or interactedCh2 == true or interactedCh3 == true):
		$QuestionMark.texture = basicTalked

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("interact") and active:
			if(StoryVariables.currentlyInChapterOne == true):
				active = false
				interactedCh1 = true
				pause_game()
				var dialog;
				if(inOverworld):
					dialog = Dialogic.start("/Marlon/marlon_ch1_overworld")
				else:
					dialog = Dialogic.start("/Marlon/marlon_ch1_wonderland")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
			elif(StoryVariables.currentlyInChapterTwo == true):
				active = false
				interactedCh2 = true
				pause_game()
				var dialog;
				if(inOverworld):
					dialog = Dialogic.start("/Marlon/marlon_ch2_overworld")
				else:
					dialog = Dialogic.start("/Marlon/marlon_ch2_wonderland")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
			elif(StoryVariables.currentlyInChapterThree == true):
				active = false
				interactedCh3 = true
				pause_game()
				var dialog;
				if(inOverworld):
					dialog = Dialogic.start("/Marlon/marlon_ch3_overworld")
				else:
					dialog = Dialogic.start("/Marlon/marlon_ch3_wonderland")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
			

func pause_game():
	get_tree().paused = true
	StoryVariables.canPlayerMove = false
	
func unpause(timeline_name):
	get_tree().paused = false
	StoryVariables.canPlayerMove = true
	
func _on_Marlon_body_entered(body):
	if body.name == 'player' and (StoryVariables.isPrologueDone == true or StoryVariables.currentlyInChapterOne == true or StoryVariables.currentlyInChapterTwo == true or StoryVariables.currentlyInChapterThree == true):
		active = true

func _on_Marlon_body_exited(body):
	if body.name == 'player':
		active = false
		
func _physics_process(_delta):
	if Input.is_action_pressed("ui_right") and StoryVariables.canPlayerMove:
		rng = rngg.randi_range(0,2)
	else:
		if inOverworld:
			match rng:
				0:
					character.play("Idle 1 Overworld")
				1:
					character.play("Idle 2 Overworld")
				2:
					character.play("Idle 3 Overworld")
		else:
			match rng:
				0:
					character.play("Idle 1 Wonderland")
				1:
					character.play("Idle 2 Wonderland")
				2:
					character.play("Idle 3 Wonderland")
