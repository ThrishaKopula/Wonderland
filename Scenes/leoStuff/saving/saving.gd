extends Node

const SAVE_FILE = "user://save_file.save"

var g_data = {}

#example of what G_data will be like
#myfamily = {
#  "child1" : {
#    "name" : "Emil",
#    "year" : 2004
#  },
#  "child2" : {
#    "name" : "Tobias",
#    "year" : 2007
#  },
#  "child3" : {
#    "name" : "Linus",
#    "year" : 2011
#  }
#}

func _ready():
	pass # Replace with function body.

func save_data():
	
	var file = File.new()
	file.open(SAVE_FILE, file.WRITE)
	file.store_var(g_data)
	file.close()
	pass
	
func load_data():
	var file = File.new()
	if not file.file_exists(SAVE_FILE):
		g_data = {
			"data1": 0,
			"data2": 0
			
		}
		save_data()
	
	file.open(SAVE_FILE, File.READ)
	g_data = file.get_var()
	file.close()
	pass
