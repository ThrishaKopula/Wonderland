extends Control

var matrix = ["B","P","R","G",  "B","P","R","G",  "B","P","R","G",  "B","P","R","G",];

var matrix_win = ["P","P","R","G",  "B","G","B","R",  "P","G","P","R",  "B","R","B","G"];

var clicked_node = null;

onready var marlon =  $"../character".get_node("AnimationPlayer");

var cheat = false;

export var turn : int  = 10;
onready var timelabel = $"../Timer/timer";

var canAudioPlay = true

func checkAudio():
	if(canAudioPlay == true):
		$"../TeaPartyAudio".play()
	else:
		$"../TeaPartyAudio".stop()
		$"../TeaPartyAudio".playing == false
# Called when the node enters the scene tree for the first time.
func _ready():
	marlon.play("Idle 2 Wonderland");
	var dialog = Dialogic.start("TeaPartyRules");
	dialog.connect('timeline_end', self, 'unpauseAfterRules');
	add_child(dialog);

func swap(item):

	if clicked_node == null:
		clicked_node = item;
		clicked_node.modulate = Color(0.662745, 0.662745, 0.662745);
		
	elif clicked_node.get_index() == item.get_index():
		item.release_focus();
		clicked_node = null;
		item.modulate = Color(1, 1, 1);
		
	elif item.get_index() - 1 == clicked_node.get_index() || item.get_index() + 1 == clicked_node.get_index()|| item.get_index() + 4 == clicked_node.get_index() || item.get_index() - 4 == clicked_node.get_index():
		
		var temp_color = matrix[item.get_index()];
		var temp_color2 = matrix[clicked_node.get_index()];
		
		matrix[item.get_index()] = temp_color2;
		matrix[clicked_node.get_index()] = temp_color;
		
		var temp_index = item.get_index();
		
		var temp2_index = clicked_node.get_index();
		
		get_node("animated").move_child(item, temp2_index);
		get_node("animated").move_child(clicked_node, temp_index);
		
		item.modulate = Color(1, 1, 1);
		clicked_node.modulate = Color(1, 1, 1);
		
		item.release_focus();
		clicked_node = null;
		
		if not cheat:
			turn = turn - 1;
			if turn <= 0:
				timelabel.text = var2str(0);
				$"../Wcon".play("lose");
				yield( $"../Wcon", "animation_finished");
				if StoryVariables.miniGameToMainMenu:
					StoryVariables.miniGameToMainMenu = false;
					Fade.change_scene("res://Scenes/thrishaStuff/MainMenu.tscn");
				else:
					get_tree().reload_current_scene();
			else:
				
				timelabel.text = var2str(turn);
		
		print("matrix:");
		print(matrix);
		print("win:");
		print(matrix_win);
		
		if matrix == matrix_win:
			print("won");
			win();
		
	else:
		
		item.modulate = Color(0.662745, 0.662745, 0.662745);
		clicked_node.modulate = Color(1, 1, 1);
		
		clicked_node = item
	
	pass

func win():
	
	$"../Wcon".play("won");
	
	yield( $"../Wcon", "animation_finished");
	
	if StoryVariables.miniGameToMainMenu:
		StoryVariables.miniGameToMainMenu = false;
		Fade.change_scene("res://Scenes/thrishaStuff/MainMenu.tscn");
	else:
		canAudioPlay = false
		checkAudio()
		var dialog = Dialogic.start("afterMiniGame");
		dialog.connect('timeline_end', self, 'unpause');
		add_child(dialog);
		StoryVariables.isPrologueDone = true;
	pass

func unpauseAfterRules(timeline_name):
	get_tree().paused = false;
	
func unpause(timeline_name):
	get_tree().paused = false;
	Fade.change_scene("res://Scenes/thrishaStuff/ContinueToChapter1.tscn");
	yield(get_tree().create_timer(2), "timeout");
	pass

func _on_A4_pressed():
	
	swap(get_node("animated/A4"));
	
	pass

func _on_B4_pressed():
	swap(get_node("animated/B4"));
	pass # Replace with function body.

func _on_C4_pressed():
	swap(get_node("animated/C4"));
	pass # Replace with function body.

func _on_D4_pressed():
	swap(get_node("animated/D4"));
	pass # Replace with function body.

func _on_A3_pressed():
	swap(get_node("animated/A3"));
	pass # Replace with function body.

func _on_B3_pressed():
	swap(get_node("animated/B3"));
	pass # Replace with function body.

func _on_C3_pressed():
	swap(get_node("animated/C3"));
	pass # Replace with function body.

func _on_D3_pressed():
	swap(get_node("animated/D3"));
	pass # Replace with function body.

func _on_A2_pressed():
	swap(get_node("animated/A2"));
	pass # Replace with function body.

func _on_B2_pressed():
	swap(get_node("animated/B2"));
	pass # Replace with function body.

func _on_C2_pressed():
	swap(get_node("animated/C2"));
	pass # Replace with function body.

func _on_D2_pressed():
	swap(get_node("animated/D2"));
	pass # Replace with function body.

func _on_A1_pressed():
	swap(get_node("animated/A1"));
	pass # Replace with function body.

func _on_B1_pressed():
	swap(get_node("animated/B1"));
	pass # Replace with function body.

func _on_C1_pressed():
	swap(get_node("animated/C1"));
	pass # Replace with function body.

func _on_D1_pressed():
	swap(get_node("animated/D1"));
	pass # Replace with function body.

func _on_cheat_mouse_entered():
	if not $"../cheat".disabled:
		$"../cheat".rect_scale = Vector2(1,1);
	pass # Replace with function body.

func _on_cheat_mouse_exited():
	if not $"../cheat".disabled:
		$"../cheat".rect_scale = Vector2(0.9,0.9);
	pass # Replace with function body.

func _on_cheat_pressed():
	cheat = true;
	$"../block".show();
	$"../overall".get_node("AnimationPlayer").play("Best Cookie (Yellow)");
	yield($"../overall".get_node("AnimationPlayer"), "animation_finished");
	$"../block".hide();
	timelabel.text = "∞";
	$"../Wcon".play("add time");
	$"../cheat".disabled = true;
	pass # Replace with function body.
