extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var character = $AnimationPlayer

onready var sprite = $body

var rng = 0
var rngg = RandomNumberGenerator.new()

var active = false

func _process(_delta):
	$QuestionMark.visible = active
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _physics_process(_delta):
	match rng:
		0:
			character.play("Idle 1 Overworld")
		1:
			character.play("Idle 2 Overworld")
		2:
			character.play("Idle 3 Overworld")

func _on_NPC_body_entered(body):
	if body.name == 'player':
		active = true

func _on_NPC_body_exited(body):
	if body.name == 'player':
		active = false
