extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
var motion = Vector2()

export var speed = 100

# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	motion = move_and_slide(motion)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_action_pressed("move_right"):
		motion.x = speed
	elif Input.is_action_pressed("move_left"):
		motion.x = -speed
	else:
		motion.x = 0
	pass
