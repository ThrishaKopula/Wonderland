extends Node2D


# Declare member variables here. Examples:
# var a = 2
var spins = true;
var red = true;

# Called when the node enters the scene tree for the first time.
func _ready():
	$winLogo.hide();
	play();
	
#	$base.get_node("AnimationPlayer").play("black win");
#	yield($base.get_node("AnimationPlayer"),"animation_finished");
#	$base.get_node("AnimationPlayer").play("resetB");
#	yield($base.get_node("AnimationPlayer"),"animation_finished");
#	$base.get_node("AnimationPlayer").play("spin");
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func play():
	
	while spins:
		if !red:
			$base.get_node("AnimationPlayer").play("resetB");
			yield($base.get_node("AnimationPlayer"),"animation_finished");
		
		$base.get_node("AnimationPlayer").play("spin");
		yield($base.get_node("AnimationPlayer"),"animation_finished");
		print("again");
	
	
	
	if StoryVariables.badPoints <= StoryVariables.goodPoints:
		
		if red:
			$base.get_node("AnimationPlayer").play("red win");
		else:
			$base.get_node("AnimationPlayer").play("black win");
		
		yield($base.get_node("AnimationPlayer"),"animation_finished");
		
		$winLogo.get_node("AnimationPlayer").play("win");
		yield(get_tree().create_timer(2), "timeout");
		
	else:
		
		if red:
			$base.get_node("AnimationPlayer").play("black win");
		else:
			$base.get_node("AnimationPlayer").play("red win");
	
		yield($base.get_node("AnimationPlayer"),"animation_finished");
		yield(get_tree().create_timer(2), "timeout");
		
		
		$winLogo.get_node("AnimationPlayer").play("lose");
	pass
	


func _on_Red_pressed():
	spins = false;
	red = true;
	pass # Replace with function body.


func _on_Black_pressed():
	spins = false;
	red = false;
	pass # Replace with function body.
