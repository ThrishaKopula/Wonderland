extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	
	pass # Replace with function body.


func change_scene(scene: String):
	
	$AnimationPlayer.play("fade");
	yield($AnimationPlayer, "animation_finished");
	get_tree().change_scene(scene);
	$AnimationPlayer.play_backwards("fade");
	yield($AnimationPlayer, "animation_finished");
	
	
	pass
