extends Sprite

onready var character = $"../AnimationPlayer"

onready var sprite = $"."

func _physics_process(_delta):
	character.play("Idle 1 Overworld")
