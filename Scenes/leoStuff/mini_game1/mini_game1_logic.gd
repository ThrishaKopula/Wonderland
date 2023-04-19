extends Control

var matrix = ["R","G","B","R", "R","G","B","R", "R","G","B","R", "R","G","B","R"]


var matrix_win = ["G","R","B","R", "R","G","B","R", "R","G","B","R", "R","G","B","R"]

var clicked_node = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func swap(item):

	if clicked_node == null:
		clicked_node = item
		
		
	elif clicked_node.get_index() == item.get_index():
		item.release_focus()
		clicked_node = null
		
	elif item.get_index() - 1 == clicked_node.get_index() || item.get_index() + 1 == clicked_node.get_index()|| item.get_index() + 4 == clicked_node.get_index() || item.get_index() - 4 == clicked_node.get_index():
		
		var temp_color = matrix[item.get_index()]
		var temp_color2 = matrix[clicked_node.get_index()]
		
		matrix[item.get_index()] = temp_color2
		matrix[clicked_node.get_index()] = temp_color
		
		var temp_index = item.get_index()
		
		var temp2_index = clicked_node.get_index()
		
		get_node("animated").move_child(item, temp2_index)
		get_node("animated").move_child(clicked_node, temp_index)
		
		item.release_focus()
		clicked_node = null
		
		print(matrix)
		
		if matrix == matrix_win:
			win()
		
	else:
		
		clicked_node = item
	
	pass

func win():
	print("you won")

	pass

func _on_A4_pressed():
	
	swap(get_node("animated/A4"))
	
	pass

func _on_B4_pressed():
	swap(get_node("animated/B4"))
	pass # Replace with function body.


func _on_C4_pressed():
	swap(get_node("animated/C4"))
	pass # Replace with function body.


func _on_D4_pressed():
	swap(get_node("animated/D4"))
	pass # Replace with function body.


func _on_A3_pressed():
	swap(get_node("animated/A3"))
	pass # Replace with function body.


func _on_B3_pressed():
	swap(get_node("animated/B3"))
	pass # Replace with function body.


func _on_C3_pressed():
	swap(get_node("animated/C3"))
	pass # Replace with function body.


func _on_D3_pressed():
	swap(get_node("animated/D3"))
	pass # Replace with function body.


func _on_A2_pressed():
	swap(get_node("animated/A2"))
	pass # Replace with function body.


func _on_B2_pressed():
	swap(get_node("animated/B2"))
	pass # Replace with function body.


func _on_C2_pressed():
	swap(get_node("animated/C2"))
	pass # Replace with function body.


func _on_D2_pressed():
	swap(get_node("animated/D2"))
	pass # Replace with function body.


func _on_A1_pressed():
	swap(get_node("animated/A1"))
	pass # Replace with function body.


func _on_B1_pressed():
	swap(get_node("animated/B1"))
	pass # Replace with function body.


func _on_C1_pressed():
	swap(get_node("animated/C1"))
	pass # Replace with function body.


func _on_D1_pressed():
	swap(get_node("animated/D1"))
	pass # Replace with function body.

