extends Control

var picked = null
var picked_type = "none"

# need 4 pairs
var pair_got = 0;
var lives = 5;
var inAct = false;
var wcard = "";
var cheat = false;

var pregame = true;
# Called when the node enters the scene tree for the first time.

var back_card = preload("res://Scenes/leoStuff/mini_game3/mini3Art/CARD_BACK.png");
var j = preload("res://Scenes/leoStuff/mini_game3/mini3Art/_CARDSCard_Mini_game-1.png");
var q = preload("res://Scenes/leoStuff/mini_game3/mini3Art/_CARDSCard_Mini_game-2.png");
var k = preload("res://Scenes/leoStuff/mini_game3/mini3Art/_CARDSCard_Mini_game-3.png");
var a = preload("res://Scenes/leoStuff/mini_game3/mini3Art/_CARDSCard_Mini_game-4.png");
var joke = preload("res://Scenes/leoStuff/mini_game3/mini3Art/_CARDSCard_Mini_game-5.png");

func _ready():
	
	new_game();
	
	pass # Replace with function body.
	
func new_game():
	$"../get".texture = back_card;
	pregame = true;
	inAct = true;
	for n in range(10):
		ran_shuffle();
		
	$"../lives".text = String(lives);
	
	yield(get_tree().create_timer(2), "timeout");
	flip_up()
	yield(get_tree().create_timer(8), "timeout");
	flip_Down();
	yield(get_tree().create_timer(1), "timeout");
	
	match pair_got:
		1:
			ran_shuffle();
			yield(get_tree().create_timer(.5), "timeout");
		2:
			for n in range(2):
				ran_shuffle();
				yield(get_tree().create_timer(2), "timeout");
		3:
			for n in range(3):
				ran_shuffle();
				yield(get_tree().create_timer(2), "timeout");
	
	inAct = false;
	get_wCard();
	pregame = false;
	pass


func get_wCard():
	var rng = RandomNumberGenerator.new()
	rng.randomize();
	var card = rng.randi_range(0,3);
	
	match card:
		0:
			$"../get".texture = j;
			wcard = "J";
			if cheat:
				$AnimatedGridContainer/J.texture_normal = j;
				$AnimatedGridContainer/J.get_child(1).disabled = true;
				pick(get_node("AnimatedGridContainer/J"), "J");
		1:
			$"../get".texture = q;
			wcard = "Q";
			if cheat:
				$AnimatedGridContainer/Q.texture_normal = q;
				$AnimatedGridContainer/Q.get_child(1).disabled = true;
				pick(get_node("AnimatedGridContainer/Q"), "Q");
		2:
			$"../get".texture = k;
			wcard = "K";
			if cheat:
				$AnimatedGridContainer/K.texture_normal = k;
				$AnimatedGridContainer/K.get_child(1).disabled = true;
				pick(get_node("AnimatedGridContainer/K"), "K");
		3:
			$"../get".texture = a;
			wcard = "A";
			if cheat:
				$AnimatedGridContainer/A.texture_normal = a;
				$AnimatedGridContainer/A.get_child(1).disabled = true;
				pick(get_node("AnimatedGridContainer/A"), "A");
	

func flip_up():
	$AnimatedGridContainer/J.texture_normal = j;
	$AnimatedGridContainer/J2.texture_normal = j;
	$AnimatedGridContainer/Q.texture_normal = q;
	$AnimatedGridContainer/Q2.texture_normal = q;
	$AnimatedGridContainer/K.texture_normal = k;
	$AnimatedGridContainer/K2.texture_normal = k;
	$AnimatedGridContainer/A.texture_normal = a;
	$AnimatedGridContainer/A2.texture_normal = a;
	$AnimatedGridContainer/Joker.texture_normal = joke;
	pass

func flip_Down():
	$AnimatedGridContainer/J.texture_normal = back_card;
	$AnimatedGridContainer/J2.texture_normal = back_card;
	$AnimatedGridContainer/Q.texture_normal = back_card;
	$AnimatedGridContainer/Q2.texture_normal = back_card;
	$AnimatedGridContainer/K.texture_normal = back_card;
	$AnimatedGridContainer/K2.texture_normal = back_card;
	$AnimatedGridContainer/A.texture_normal = back_card;
	$AnimatedGridContainer/A2.texture_normal = back_card;
	$AnimatedGridContainer/Joker.texture_normal = back_card;
	pass

func _on_J_pressed():
	if !inAct:
		$AnimatedGridContainer/J.texture_normal = j;
		print("J1 pressed");
		pick(get_node("AnimatedGridContainer/J"), "J");
	pass # Replace with function body.


func _on_J2_pressed():
	if !inAct:
		print("J2 pressed");
		$AnimatedGridContainer/J2.texture_normal = j;
		pick(get_node("AnimatedGridContainer/J2"), "J");
	pass # Replace with function body.
	

func pick(item,type):
	print("start pick");
	
	if type == "Joker":
		lives -= 1;
		$"../lives".text = String(lives);
		inAct = true;
		yield(get_tree().create_timer(2), "timeout");
		$AnimatedGridContainer/Joker.texture_normal = back_card;
		if picked_type != "none" and !cheat:
			picked.texture_normal = back_card;
			picked = null;
			picked_type = "none";
			
		inAct = false;
		
	elif picked_type == "none":
		print("none")
		picked_type = type;
		
		picked = item;
		
		item.get_child(1).disabled = true;
		$"../cheat".disabled = true;
		
	elif picked_type == type and wcard == type:
		
		print("same");
		
		item.get_child(1).disabled = false;
		
		pair_got += 1;
		inAct = true;
		yield(get_tree().create_timer(2), "timeout");
		
		item.texture_normal = back_card;
		
		picked.get_child(1).disabled = false;
		picked.texture_normal = back_card;
		picked = null;
		picked_type = "none";
		
		if !cheat:
			$"../cheat".disabled = false;
		
		yield(get_tree().create_timer(1), "timeout");
		if pair_got >= 4:
			$"../winLogo/AnimationPlayer".play("win");
		else:
			new_game();
		
	else:
		print("else");
		lives -= 1;
		$"../lives".text = String(lives);
		inAct = true;
		yield(get_tree().create_timer(2), "timeout");
		inAct = false;
		item.texture_normal = back_card;
		
		if !cheat:
			$"../cheat".disabled = false;
			picked.texture_normal = back_card;
			picked.get_child(1).disabled = false;
			picked = null;
			picked_type = "none";
		
	if lives <=  0:
		lose();
		
	pass
	
func lose():
	
	$"../winLogo/AnimationPlayer".play("lose");
	
	pass

func ran_shuffle():
	var rng = RandomNumberGenerator.new()
	rng.randomize();
	var index1 =  rng.randi_range(0,8);
	var index2 =  rng.randi_range(0,8);
	
	while(index1 == index2):
		index2 =  rng.randi_range(0,8);
	
	#while index1 == index2:
	#	index2 = rng.randi_range(0,8)
	
#	var index1 = 0
#	var index2 = 1
	
	var item1 = get_node("AnimatedGridContainer").get_child(index1);
	var item2 = get_node("AnimatedGridContainer").get_child(index2);
	
	get_node("AnimatedGridContainer").move_child(item1, index2);
	get_node("AnimatedGridContainer").move_child(item2, index1);
	
	
	pass



func _on_Q_pressed():
	if !inAct:
		$AnimatedGridContainer/Q.texture_normal = q;
		pick(get_node("AnimatedGridContainer/Q"), "Q");
	pass # Replace with function body.


func _on_Q2_pressed():
	if !inAct:
		$AnimatedGridContainer/Q2.texture_normal = q;
		pick(get_node("AnimatedGridContainer/Q2"), "Q");
	pass # Replace with function body.


func _on_K_pressed():
	if !inAct:
		$AnimatedGridContainer/K.texture_normal = k;
		pick(get_node("AnimatedGridContainer/K"), "K");
	pass # Replace with function body.

func _on_K2_pressed():
	if !inAct:
		$AnimatedGridContainer/K2.texture_normal = k;
		pick(get_node("AnimatedGridContainer/K2"), "K");
	pass # Replace with function body.

func _on_A_pressed():
	if !inAct:
		$AnimatedGridContainer/A.texture_normal = a;
		pick(get_node("AnimatedGridContainer/A"), "A");
	pass # Replace with function body.

func _on_A2_pressed():
	if !inAct:
		$AnimatedGridContainer/A2.texture_normal = a;
		pick(get_node("AnimatedGridContainer/A2"), "A");
	pass # Replace with function body.


func _on_Joke_pressed():
	if !inAct:
		$AnimatedGridContainer/Joker.texture_normal = joke;
		pick(get_node("AnimatedGridContainer/Joker"), "Joker");
	pass # Replace with function body.


func _on_cheat_pressed():
	
	inAct = true;
	cheat = true;
	
	$"../overall".get_node("AnimationPlayer").play("Pink Cookie");
	StoryVariables.badPoints += 1;
	$"../cheat".disabled = true;
	
	yield ($"../overall".get_node("AnimationPlayer"),"animation_finished");
	
	lives = lives + 5;
	$"../lives".text = String(lives);
	$"../lives/AnimationPlayer".play("flash");
	inAct = false;
	
	if !pregame:
		match wcard:
			"J":
				$AnimatedGridContainer/J.texture_normal = j;
				$AnimatedGridContainer/J.get_child(1).disabled = true;
				pick(get_node("AnimatedGridContainer/J"), "J");
			"Q":
				$AnimatedGridContainer/Q.texture_normal = q;
				$AnimatedGridContainer/Q.get_child(1).disabled = true;
				pick(get_node("AnimatedGridContainer/Q"), "Q");
			"K":
				$AnimatedGridContainer/K.texture_normal = k;
				$AnimatedGridContainer/K.get_child(1).disabled = true;
				pick(get_node("AnimatedGridContainer/K"), "K");
			"A":
				$AnimatedGridContainer/A.texture_normal = a;
				$AnimatedGridContainer/A.get_child(1).disabled = true;
				pick(get_node("AnimatedGridContainer/A"), "A");
	
	pass # Replace with function body.
