extends Area2D

onready var character = $AnimationPlayer

onready var sprite = $body

func _physics_process(_delta):
	character.play("Idle 3 Overworld")

