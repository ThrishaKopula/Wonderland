extends CanvasLayer

var hid = true;
onready var text = $"name of place";
var change_text;

export var enable = true;

onready var trans = $"../trans/TransitionColor";

onready var overworld = preload("res://art/pokemon map.PNG");

onready var wonderland = preload("res://art/1200px-LGPE_Kanto_Map.png");

export var isOverworld = true;

func _ready():
	
	if !isOverworld:
		isOverworld = true;
		changeMap();
		isOverworld = false;
	
	trans.show();
	text.hide();
	change_text = text.get_child(0).get_child(0);
	trans.get_child(0).play("transition_out");
	hide();
	
	trans.get_child(0).play("transition_in");
	yield(trans.get_child(0), "animation_finished");
	trans.hide();
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(delta):
	
	if Input.is_action_just_pressed("map") and !hid and enable:
		hide();
		hid = true;
	elif Input.is_action_just_pressed("map") and hid and enable:
		show();
		hid = false;
	pass


func _on_Button_mouse_entered():
	print("in");
	change_text.text = "Dorm";
	text.show();
	pass # Replace with function body.

func _on_Button_mouse_exited():
	text.hide();
	pass # Replace with function body.

func _on_Button_hide():
	text.hide();
	pass # Replace with function body.
	
func _on_Button_pressed():
	trans.show();
	trans.get_child(0).play("transition_out");
	yield(trans.get_child(0), "animation_finished");
	
	get_tree().change_scene("res://Scenes/thrishaStuff/Locations/Overworld/Dorm.tscn");
	pass # Replace with function body.


func _on_Button2_mouse_entered():
	change_text.text = "Hallway";
	text.show();
	
	pass # Replace with function body.


func _on_Button2_mouse_exited():
	text.hide();
	pass # Replace with function body.


func _on_Button2_hide():
	text.hide();
	pass # Replace with function body.


func _on_Button2_pressed():
	
	get_tree().change_scene("res://Scenes/thrishaStuff/Locations/Overworld/Hallway.tscn");
	pass

func _on_cafe_pressed():
	get_tree().change_scene("res://Scenes/thrishaStuff/Locations/Overworld/Cafeteria.tscn");
	pass # Replace with function body.


func _on_cafe_mouse_entered():
	change_text.text = "Cafeteria";
	text.show();
	pass # Replace with function body.


func _on_cafe_mouse_exited():
	text.hide();
	pass # Replace with function body.


func _on_cafe_hide():
	text.hide();
	pass # Replace with function body.


func _on_sport_pressed():
	get_tree().change_scene("res://Scenes/thrishaStuff/Locations/Overworld/SportsField.tscn");
	pass # Replace with function body.


func _on_sport_mouse_entered():
	change_text.text = "Sports Field";
	text.show();
	pass # Replace with function body.


func _on_sport_mouse_exited():
	text.hide();
	pass # Replace with function body.


func _on_sport_hide():
	text.hide();
	pass # Replace with function body.


func _on_classroom_pressed():
	get_tree().change_scene("res://Scenes/thrishaStuff/Locations/Overworld/Classroom.tscn");
	pass # Replace with function body.


func _on_classroom_hide():
	text.hide();
	pass # Replace with function body.


func _on_classroom_mouse_entered():
	change_text.text = "Classroom";
	text.show();
	pass # Replace with function body.


func _on_classroom_mouse_exited():
	text.hide();
	pass # Replace with function body.


func _on_change_pressed():
	
	changeMap();
		
	pass # Replace with function body.


func changeMap():
	
	if isOverworld:
		$PokemonMap.texture = wonderland;
		isOverworld = false;
		
		$classroom.hide();
		$Sports.hide();
		$Cafe.hide();
		$Hallway.hide();
		$dorm.hide();
		
		$ArstocratTown.show();
		$Courtyard.show();
		$PlebTown.show();
		$QueenCourt.show();
		$Tavern.show();
		$TeaParty.show();
		
		
	else:
		$PokemonMap.texture = overworld
		isOverworld = true;
		
		$ArstocratTown.hide();
		$Courtyard.hide();
		$PlebTown.hide();
		$QueenCourt.hide();
		$Tavern.hide();
		$TeaParty.hide();
		
		
		$classroom.show();
		$Sports.show();
		$Cafe.show();
		$Hallway.show();
		$dorm.show();
	
	pass

func _on_ArstocratTown_pressed():
	get_tree().change_scene("res://Scenes/thrishaStuff/Locations/Wonderland/AristocratTown.tscn");
	
	pass # Replace with function body.


func _on_ArstocratTown_mouse_entered():
	
	change_text.text = "Arstocrat Town";
	text.show();
	
	pass # Replace with function body.


func _on_ArstocratTown_mouse_exited():
	text.hide();
	pass # Replace with function body.


func _on_ArstocratTown_hide():
	text.hide();
	pass # Replace with function body.

func _on_Courtyard_pressed():
	get_tree().change_scene("res://Scenes/thrishaStuff/Locations/Wonderland/Courtyard.tscn");
	
	pass # Replace with function body.


func _on_Courtyard_mouse_entered():
	change_text.text = "Courtyard";
	text.show();
	pass # Replace with function body.


func _on_Courtyard_mouse_exited():
	text.hide();
	pass # Replace with function body.


func _on_Courtyard_hide():
	text.hide();
	pass # Replace with function body.
	


func _on_PlebTown_pressed():
	get_tree().change_scene("res://Scenes/thrishaStuff/Locations/Wonderland/PlebTown.tscn");
	
	pass # Replace with function body.


func _on_PlebTown_mouse_entered():
	change_text.text = "Pleb Town";
	text.show();
	pass # Replace with function body.


func _on_PlebTown_mouse_exited():
	text.hide();
	pass # Replace with function body.


func _on_PlebTown_hide():
	text.hide();
	pass # Replace with function body.



func _on_QueenCourt_pressed():
	get_tree().change_scene("res://Scenes/thrishaStuff/Locations/Wonderland/QueenCourt.tscn");
	
	pass # Replace with function body.


func _on_QueenCourt_mouse_entered():
	change_text.text = "Queen Court";
	text.show();
	pass # Replace with function body.


func _on_QueenCourt_mouse_exited():
	text.hide();
	pass # Replace with function body.


func _on_QueenCourt_hide():
	text.hide();
	pass # Replace with function body.
	
	


func _on_Tavern_pressed():
	get_tree().change_scene("res://Scenes/thrishaStuff/Locations/Wonderland/Tavern.tscn");
	
	pass # Replace with function body.


func _on_Tavern_mouse_entered():
	change_text.text = "Tavern";
	text.show();
	pass # Replace with function body.


func _on_Tavern_mouse_exited():
	text.hide();
	pass # Replace with function body.


func _on_Tavern_hide():
	text.hide();
	pass # Replace with function body.
	
	


func _on_TeaParty_pressed():
	get_tree().change_scene("res://Scenes/thrishaStuff/Locations/Wonderland/TeaParty.tscn");
	
	pass # Replace with function body.


func _on_TeaParty_mouse_entered():
	change_text.text = "Tea Party";
	text.show();
	pass # Replace with function body.


func _on_TeaParty_mouse_exited():
	text.hide();
	pass # Replace with function body.


func _on_TeaParty_hide():
	text.hide();
	pass # Replace with function body.
