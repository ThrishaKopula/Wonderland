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
		if event.is_action_pressed("ui_accept") and active:
			pause_game()
			var dialog = Dialogic.start("ifMirrorClicked")
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS
			dialog.connect('timeline_end', self, 'unpause')
			add_child(dialog)
			StoryVariables.isMirrorInteracted = true
			StoryVariables.prologue_checkAllInteractions()
			
func pause_game():
	get_tree().paused = true
	StoryVariables.canPlayerMove = false
	
func unpause(timeline_name):
	get_tree().paused = false
	StoryVariables.canPlayerMove = true
	active = false

func _on_Mirror_body_entered(body):
	if (body.name == 'player' and StoryVariables.isPrologueDone == false):
		active = true

func _on_Mirror_body_exited(body):
	if (body.name == 'player' and StoryVariables.isPrologueDone == false):
		active = false
