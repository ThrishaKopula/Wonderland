extends CanvasLayer

var hid = true;
onready var text = $"name of place";
var change_text;

export var enable = true;

onready var overworld = preload("res://Scenes/leoStuff/HUD/map/mapArt/Map_Overworld-1.png");

onready var wonderland = preload("res://Scenes/leoStuff/HUD/map/mapArt/Map_Wonderland-1.png");

onready var wonderlandlock = preload("res://Scenes/leoStuff/HUD/map/mapArt/Map_Wonderland_Locked.png");

onready var overworldBut = preload("res://Scenes/leoStuff/HUD/map/mapArt/Map_Overworld_BUTTON.png");

onready var wonderlandBut = preload("res://Scenes/leoStuff/HUD/map/mapArt/Map_Wonderland_BUTTON.png");

export var isOverworld = true;

onready var label1 = preload("res://Scenes/leoStuff/HUD/map/mapArt/dorm.png");
onready var label2 = preload("res://Scenes/leoStuff/HUD/map/mapArt/sport.png");
onready var label3 = preload("res://Scenes/leoStuff/HUD/map/mapArt/class.png");
onready var label4 = preload("res://Scenes/leoStuff/HUD/map/mapArt/hall.png");
onready var label5 = preload("res://Scenes/leoStuff/HUD/map/mapArt/cafe.png");

onready var atown = preload("res://Scenes/leoStuff/HUD/map/mapArt/atown.png");
onready var tparty = preload("res://Scenes/leoStuff/HUD/map/mapArt/tparty.png");
onready var ptown = preload("res://Scenes/leoStuff/HUD/map/mapArt/ptown.png");
onready var qcourt = preload("res://Scenes/leoStuff/HUD/map/mapArt/qCourt.png");
onready var qcourtyard = preload("res://Scenes/leoStuff/HUD/map/mapArt/qCourtyard.png");
onready var tavern = preload("res://Scenes/leoStuff/HUD/map/mapArt/tavern.png");

func _ready():
	
	
	
	if !isOverworld:
		isOverworld = true;
		changeMap();
		isOverworld = false;
	
	text.hide();
	change_text = text.get_child(0).get_child(0);
	hide();
	
	if !StoryVariables.isPrologueDone:
		enable = false;

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(delta):
	
	if Input.is_action_just_pressed("map") and !hid and enable and !get_tree().paused:
		hide();
		hid = true;
	elif Input.is_action_just_pressed("map") and hid and enable and !get_tree().paused:
		show();
		hid = false;
	pass


func _on_Button_mouse_entered():
	
	change_text.texture = label1;
	text.show();
	pass # Replace with function body.

func _on_Button_mouse_exited():
	text.hide();
	pass # Replace with function body.

func _on_Button_hide():
	text.hide();
	pass # Replace with function body.
	
func _on_Button_pressed():
	
	Fade.change_scene("res://Scenes/thrishaStuff/Locations/Overworld/Dorm.tscn");
	
	#get_tree().change_scene("res://Scenes/thrishaStuff/Locations/Overworld/Dorm.tscn");
	pass # Replace with function body.


func _on_Button2_mouse_entered():
	change_text.texture = label4;
	text.show();
	
	pass # Replace with function body.


func _on_Button2_mouse_exited():
	text.hide();
	pass # Replace with function body.


func _on_Button2_hide():
	text.hide();
	pass # Replace with function body.


func _on_Button2_pressed():
	
	Fade.change_scene("res://Scenes/thrishaStuff/Locations/Overworld/Hallway.tscn");
	
	#get_tree().change_scene("res://Scenes/thrishaStuff/Locations/Overworld/Hallway.tscn");
	pass

func _on_cafe_pressed():
	
	Fade.change_scene("res://Scenes/thrishaStuff/Locations/Overworld/Cafeteria.tscn");
	#get_tree().change_scene("res://Scenes/thrishaStuff/Locations/Overworld/Cafeteria.tscn");
	pass # Replace with function body.


func _on_cafe_mouse_entered():
	change_text.texture = label5;
	text.show();
	pass # Replace with function body.


func _on_cafe_mouse_exited():
	text.hide();
	pass # Replace with function body.


func _on_cafe_hide():
	text.hide();
	pass # Replace with function body.


func _on_sport_pressed():
	Fade.change_scene("res://Scenes/thrishaStuff/Locations/Overworld/SportsField.tscn");
	#get_tree().change_scene("res://Scenes/thrishaStuff/Locations/Overworld/SportsField.tscn");
	pass # Replace with function body.


func _on_sport_mouse_entered():
	change_text.texture = label2;
	text.show();
	pass # Replace with function body.


func _on_sport_mouse_exited():
	text.hide();
	pass # Replace with function body.


func _on_sport_hide():
	text.hide();
	pass # Replace with function body.


func _on_classroom_pressed():
	Fade.change_scene("res://Scenes/thrishaStuff/Locations/Overworld/Classroom.tscn");
	#get_tree().change_scene("res://Scenes/thrishaStuff/Locations/Overworld/Classroom.tscn");
	pass # Replace with function body.


func _on_classroom_hide():
	text.hide();
	pass # Replace with function body.


func _on_classroom_mouse_entered():
	change_text.texture = label3;
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
		if StoryVariables.isChapter3Minigame:
			$PokemonMap.texture = wonderland;
		else:
			$PokemonMap.texture = wonderlandlock
		
		
		isOverworld = false;
		
		$classroom.hide();
		$Sports.hide();
		$Cafe.hide();
		$Hallway.hide();
		$dorm.hide();
		
		
		$change.icon = wonderlandBut;
		$ArstocratTown.show();
		$Courtyard.show();
		$PlebTown.show();
		if StoryVariables.isChapter3Minigame:
			$QueenCourt.show();
		$Tavern.show();
		$TeaParty.show();
		
		
	else:
		$PokemonMap.texture = overworld
		isOverworld = true;
		
		
		$change.icon = overworldBut;
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
	Fade.change_scene("res://Scenes/thrishaStuff/Locations/Wonderland/AristocratTown.tscn");
	#get_tree().change_scene("res://Scenes/thrishaStuff/Locations/Wonderland/AristocratTown.tscn");
	
	pass # Replace with function body.


func _on_ArstocratTown_mouse_entered():
	
	change_text.texture = atown;
	text.show();
	
	pass # Replace with function body.


func _on_ArstocratTown_mouse_exited():
	text.hide();
	pass # Replace with function body.


func _on_ArstocratTown_hide():
	text.hide();
	pass # Replace with function body.

func _on_Courtyard_pressed():
	Fade.change_scene("res://Scenes/thrishaStuff/Locations/Wonderland/Courtyard.tscn");
	#get_tree().change_scene("res://Scenes/thrishaStuff/Locations/Wonderland/Courtyard.tscn");
	
	pass # Replace with function body.


func _on_Courtyard_mouse_entered():
	change_text.texture = qcourtyard;
	text.show();
	pass # Replace with function body.


func _on_Courtyard_mouse_exited():
	text.hide();
	pass # Replace with function body.


func _on_Courtyard_hide():
	text.hide();
	pass # Replace with function body.
	


func _on_PlebTown_pressed():
	Fade.change_scene("res://Scenes/thrishaStuff/Locations/Wonderland/PlebTown.tscn");
	#get_tree().change_scene("res://Scenes/thrishaStuff/Locations/Wonderland/PlebTown.tscn");
	
	pass # Replace with function body.


func _on_PlebTown_mouse_entered():
	change_text.texture = ptown;
	text.show();
	pass # Replace with function body.


func _on_PlebTown_mouse_exited():
	text.hide();
	pass # Replace with function body.


func _on_PlebTown_hide():
	text.hide();
	pass # Replace with function body.



func _on_QueenCourt_pressed():
	Fade.change_scene("res://Scenes/thrishaStuff/Locations/Wonderland/QueenCourt.tscn");
	#get_tree().change_scene("res://Scenes/thrishaStuff/Locations/Wonderland/QueenCourt.tscn");
	
	pass # Replace with function body.


func _on_QueenCourt_mouse_entered():
	change_text.texture = qcourt;
	text.show();
	pass # Replace with function body.


func _on_QueenCourt_mouse_exited():
	text.hide();
	pass # Replace with function body.


func _on_QueenCourt_hide():
	text.hide();
	pass # Replace with function body.
	
	


func _on_Tavern_pressed():
	Fade.change_scene("res://Scenes/thrishaStuff/Locations/Wonderland/Tavern.tscn");
	#get_tree().change_scene("res://Scenes/thrishaStuff/Locations/Wonderland/Tavern.tscn");
	
	pass # Replace with function body.


func _on_Tavern_mouse_entered():
	change_text.texture = tavern;
	text.show();
	pass # Replace with function body.


func _on_Tavern_mouse_exited():
	text.hide();
	pass # Replace with function body.


func _on_Tavern_hide():
	text.hide();
	pass # Replace with function body.
	
	


func _on_TeaParty_pressed():
	Fade.change_scene("res://Scenes/thrishaStuff/Locations/Wonderland/TeaParty.tscn");
	#get_tree().change_scene("res://Scenes/thrishaStuff/Locations/Wonderland/TeaParty.tscn");
	
	pass # Replace with function body.


func _on_TeaParty_mouse_entered():
	change_text.texture = tparty;
	text.show();
	pass # Replace with function body.


func _on_TeaParty_mouse_exited():
	text.hide();
	pass # Replace with function body.


func _on_TeaParty_hide():
	text.hide();
	pass # Replace with function body.


func _on_change_mouse_entered():
	$change.rect_scale = Vector2(1,1);
	pass # Replace with function body.


func _on_change_mouse_exited():
	$change.rect_scale = Vector2(.8,.8);
	pass # Replace with function body.
