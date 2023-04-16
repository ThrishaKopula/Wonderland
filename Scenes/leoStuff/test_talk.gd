extends Area2D

var talk_able = false

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("talk") and talk_able:
		print("talk")


func _on_Area2D_body_entered(body):
	
	talk_able = true
	print("wow")
	pass # Replace with function body.


func _on_Area2D_body_exited(body):
	talk_able = false
	print("not wow")
	pass # Replace with function body.
