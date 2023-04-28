extends Node

# Declare member variables here. Examples:
var isMapInteracted = false
var isAlisBedInteracted = false
var isOtherBedInteracted = false
var isMirrorInteracted = false

# Main game checkpoints
#PROLOGUE
var isPrologueDone = false

#CHAPTER ONE
var isChapterOneStartDone = false

#Getting Strings For Bard
var isInitiateMainQuestDone = false
var isSearchForStringsDone = false
var isDeliverLetterToLover = false
var isReportBackToMusicGeek = false
var isDeliverStringsToBard = false

#Trading Vendors
var isCollectOtherworldlyItems = false;
var isPleb_AItemCollected = false;
var isPleb_BItemCollected = false;
var isPleb_CItemCollected = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func prologue_checkAllInteractions():
	if (isMapInteracted == true && isAlisBedInteracted == true && isOtherBedInteracted == true && isMirrorInteracted == true):
#		var dialog = Dialogic.start("movingInPart2")
		var dialog = Dialogic.start("testing")
		add_child(dialog)
		yield(dialog, 'timeline_end')
		isPrologueDone = true

func chapter1_checkIfPlebItemsCollected():
	if (isPleb_AItemCollected == true && isPleb_BItemCollected == true && isPleb_CItemCollected == true):
		var dialog = Dialogic.start("collectOtherworldlyItems")
		add_child(dialog)
		yield(dialog, 'timeline_end')
		isPrologueDone = true
