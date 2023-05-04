extends KinematicBody2D

export(int) var speed = 600

func _physics_process(_delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1.0
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1.0
	move_and_slide(velocity * speed)
