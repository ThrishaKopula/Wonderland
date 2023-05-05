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
			if(StoryVariables.isGetIngredientsFromVendors == true):
				pause_game()
				var dialog = Dialogic.start("ifWatercolorClicked")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
				StoryVariables.isPleb_AItemCollected = true
				StoryVariables.chapter1_checkIfPlebItemsCollected()
			
func pause_game():
	get_tree().paused = true
	StoryVariables.canPlayerMove = false
	
func unpause(timeline_name):
	get_tree().paused = false
	StoryVariables.canPlayerMove = true
	active = false

func _on_Watercolor_body_entered(body):
	if (body.name == 'player' and StoryVariables.isGetIngredientsFromVendors == true):
		active = true

func _on_Watercolor_body_exited(body):
	if (body.name == 'player' and StoryVariables.isGetIngredientsFromVendors == true):
		active = false
