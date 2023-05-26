extends Sprite

onready var character = $"../AnimationPlayer2"

onready var sprite = $"."

func _physics_process(_delta):
	character.play("Idle 2 Overworld")
