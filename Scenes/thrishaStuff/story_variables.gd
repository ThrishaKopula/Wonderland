extends Node


# Declare member variables here. Examples:
var canPlayerMove = true
var isLeft = false
var isRight = false

var isMapInteracted = false
var isAlisBedInteracted = false
var isOtherBedInteracted = false
var isMirrorInteracted = false

# Main game checkpoints
var isPrologueDone = false
var isChapterOneDone = false
var isChapterTwoDone = false
var isChapterThreeDone = false

#CHAPTER ONE
var isChapterOneStartDone = false

#Getting Strings For Bard
var isInitiateMainQuestDone = false
var isSearchForStringsDone = false
var isDeliverLetterToLover = false
var isReportBackToMusicGeek = false
var isDeliverStringsToBard = false

#Trading Vendors
var isGetIngredientsFromVendors = false
var isCollectOtherworldlyItems = false
var isPleb_AItemCollected = false
var isPleb_BItemCollected = false
var isPleb_CItemCollected = false
var isAllItemsCollected = false
var isBringIngredientsToTavern = false
var isGetBallerinaFromBartender = false
var isGiveBallerinaToMatthew = false

#CHAPTER 2
var isChapterTwoStart= false
var isInitiateCh2MainQuest = false
var isFindWhoIsCloseToJanitor = false
var isRetrieveExoticFruit = false
var isCatchTheThief = false
var isBringThiefToVendors = false
var isDeliverExoticFruitToLunchLady = false
var isDeliverToJanitor = false
var isAfterCleaningMinigame = false
var isDeliverKeyToMatthew = false

#CATCH THE THIEF GAME
var isInTavern = false
var isInPlebTown = false
var isInAristocratTown = false
var catch_tavern = false
var catch_plebTown = false
var catch_aristocratTown = false
var mini_game1 = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func prologue_checkAllInteractions():
	if (isMapInteracted == true && isAlisBedInteracted == true && isOtherBedInteracted == true && isMirrorInteracted == true):
		get_tree().paused = true
		canPlayerMove = false
		var dialog = Dialogic.start("movingInPart2")
		dialog.pause_mode = Node.PAUSE_MODE_PROCESS
		dialog.connect('timeline_end', self, 'unpause')
		add_child(dialog)
		isPrologueDone = true
	
func unpause(timeline_name):
	get_tree().paused = false
	canPlayerMove = true
	get_tree().change_scene("res://Scenes/leoStuff/mini_game1/mini_game_1.tscn")

func chapter1_checkIfPlebItemsCollected():
	if (isPleb_AItemCollected == true && isPleb_BItemCollected == true && isPleb_CItemCollected == true):
		isAllItemsCollected = true

func chapter2_checkCatchTheThief():
	if (catch_aristocratTown == true && catch_plebTown == true && catch_tavern == true):
		isCatchTheThief = true
		get_tree().paused = true
		canPlayerMove = false
		var dialog = Dialogic.start("afterThiefGame")
		dialog.pause_mode = Node.PAUSE_MODE_PROCESS
		dialog.connect('timeline_end', self, 'unpause')
		add_child(dialog)
		

