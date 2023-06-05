extends Node2D

onready var character = $AnimationPlayer


func _physics_process(_delta):
	character.play("idle")

var canAudioPlay = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func checkAudio():
	if(canAudioPlay == true):
		$TitleAudio.play()
	else:
		$TitleAudio.stop()
		$TitleAudio.playing == false

func _on_clickAnywhere_button_down():
	$ButtonClick.play()

func _on_clickAnywhere_pressed():
	canAudioPlay = false
	checkAudio()
	Fade.change_scene("res://Scenes/thrishaStuff/MainMenu.tscn")
	yield(get_tree().create_timer(2), "timeout")
