extends Sprite

onready var character = $"../AnimationPlayer3"

onready var sprite = $"."

func _physics_process(_delta):
	character.play("Idle 3 Overworld")
