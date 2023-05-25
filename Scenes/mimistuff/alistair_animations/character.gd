extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var character = $AnimationPlayer

onready var sprite = $body

export var inOverworld = true
export(int) var speed = 600

var rng = 0
var rngg = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _physics_process(_delta):
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("ui_right") and StoryVariables.canPlayerMove:
		
		rng = rngg.randi_range(0,2)
		
		if inOverworld:
			character.play("Run Overworld")
		else:
			character.play("Run Wonderland")
		
		
		sprite.set_scale(Vector2(-1,1))
		velocity.x += 1.0
	elif Input.is_action_pressed("ui_left") and StoryVariables.canPlayerMove:
		
		rng = rngg.randi_range(0,2)
		
		if inOverworld:
			character.play("Run Overworld")
		else:
			character.play("Run Wonderland")
		
		sprite.set_scale(Vector2(1,1))
		velocity.x -= 1.0
		
	else:
		
		if inOverworld:
			
			match rng:
				0:
					character.play("Idle 1 Overworld")
				1:
					character.play("Idle 2 Overworld")
				2:
					character.play("Idle 3 Overworld")
		else:
			
			match rng:
				0:
					character.play("Idle 1 Wonderland")
				1:
					character.play("Idle 2 Wonderland")
				2:
					character.play("Idle 3 Wonderland")
	
	move_and_slide(velocity * speed)



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
