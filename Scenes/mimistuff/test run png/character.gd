extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var character = $AnimationPlayer



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _physics_process(_delta):
	if Input.is_action_pressed("ui_right"):
		character.play("Run")
		$torso.h_flip = false
	elif Input.is_action_pressed("ui_left"):
		character.play("Run")
		$torso.h_flip = true
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
