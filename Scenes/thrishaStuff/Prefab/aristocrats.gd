extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var aristo = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match aristo:
		0: 
			$AnimationPlayer.play("Idle 1 Overworld")
		1:
			$AnimationPlayer.play("Idle 2 Overworld")
		2:
			$AnimationPlayer.play("Idle 3 Overworld")
