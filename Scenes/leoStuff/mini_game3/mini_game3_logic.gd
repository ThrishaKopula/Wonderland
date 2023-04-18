extends Control

var picked = null
var picked_type = "none"

# need 4 pairs
var pair_got = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	
	$AnimationPlayer.play("shuffle")
	
	#$AnimationPlayer.play("flip to up")
	#$AnimatedGridContainer/J/Button.disabled = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_J_pressed():
	$AnimatedGridContainer/J.texture_normal = load("res://art/blue.png")
	print("J1 pressed")
	pick(get_node("AnimatedGridContainer/J"), "J")
	pass # Replace with function body.


func _on_J2_pressed():
	print("J2 pressed")
	pass # Replace with function body.
	

func pick(item,type):
	
	if type == "Joker":
		lose()
		
	elif type == "none":
		
		picked_type = type
		
		item.get_child(1).disabled = true
		
	elif picked_type == type:
		
		item.get_child(1).disabled = true
		
		pair_got += 1
	else:
		
		#need to add a wait before switching back
		
		picked.texture_normal = load("res://icon.png")
		item.texture_normal = load("res://icon.png")
		
		picked.get_child(1).disabled = false
		
		lose()
	
	if pair_got == 4:
		print("win")
		
	pass
	
func lose():
	print("L")
	pass

func ran_shuffle():
	var rng = RandomNumberGenerator.new()
	
	#var index1 =  rng.randi_range(0,8)
	#var index2 =  rng.randi_range(0,8)
	
	#while index1 == index2:
	#	index2 = rng.randi_range(0,8)
	
	var index1 = 0
	var index2 = 1
	
	var item1 = get_node("AnimatedGridContainer").get_child(index1)
	var item2 = get_node("AnimatedGridContainer").get_child(index2)
	
	get_node("AnimatedGridContainer").move_child(item1, index2)
	get_node("AnimatedGridContainer").move_child(item2, index1)
	
	print("moved")
