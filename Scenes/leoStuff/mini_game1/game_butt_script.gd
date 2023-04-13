extends GridContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var clicked = [-1,-1]

var clicked_texture = null

var matrix = [["R","G","B","R"], ["R","G","B","R"],["R","G","B","R"],["R","G","B","R"]]

# Called when the node enters the scene tree for the first time.
func _ready():

	pass

func _on_A4_pressed():
	swap([0,0],$A4)
	#swap([0,0],$A4)
	pass # Replace with function body.


func _on_B4_pressed():
	print($B4.get_index())
	swap([0,1],$B4)
	pass # Replace with function body.


func _on_C4_pressed():
	swap([0,2],$C4)
	pass # Replace with function body.


func _on_D4_pressed():
	swap([0,3],$D4)
	pass # Replace with function body.


func _on_A3_pressed():
	swap([1,0],$A3)
	pass # Replace with function body.


func _on_B3_pressed():
	swap([1,1],$B3)
	pass # Replace with function body.


func _on_C3_pressed():
	swap([1,2],$C3)
	pass # Replace with function body.


func _on_D3_pressed():
	swap([1,3],$D3)
	pass # Replace with function body.


func _on_A2_pressed():
	swap([2,0],$A2)
	pass # Replace with function body.


func _on_B2_pressed():
	swap([2,1],$B2)
	pass # Replace with function body.


func _on_C2_pressed():
	swap([2,2],$C2)
	pass # Replace with function body.


func _on_D2_pressed():
	swap([2,3],$D2)
	pass # Replace with function body.


func _on_A1_pressed():
	swap([3,0],$A1)
	pass # Replace with function body.


func _on_B1_pressed():
	swap([3,1],$B1)
	pass # Replace with function body.


func _on_C1_pressed():
	swap([3,2],$C1)
	pass # Replace with function body.


func _on_D1_pressed():
	swap([3,3],$D1)
	pass # Replace with function body.


func swap(current,item):
	
	if clicked == [-1,-1]:
		
		clicked = current
		clicked_texture = item
		
	elif clicked == current:
		
		clicked = [-1,-1]
		item.release_focus()
		clicked_texture = null
		
	elif [current[0] - 1 ,current[1]] == [clicked[0], clicked[1]] || [current[0] ,current[1] - 1] == [clicked[0], clicked[1]] || [current[0] + 1,current[1]] == [clicked[0], clicked[1]] || [current[0] ,current[1] + 1] == [clicked[0], clicked[1]]:
		var temp = matrix[clicked[0]][clicked[1]]
		
		matrix[clicked[0]][clicked[1]] = matrix[current[0]][current[1]]
		matrix[current[0]][current[1]] = temp
		clicked = [-1,-1]
		
		var temp2 = clicked_texture.get("custom_styles/normal")
		clicked_texture.set("custom_styles/normal",item.get("custom_styles/normal"))

		item.set("custom_styles/normal",temp2)
		
		
		item.release_focus()
		
		var mx = ""
		for x in 4:
			for y in 4:
				mx += matrix[x][y]
			
			print(mx)
			mx = ""
		
	else:
		
		clicked = current
		clicked_texture = item
	
	pass

