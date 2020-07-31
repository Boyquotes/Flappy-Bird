extends Node

var score = 0
var highscore = 0
var score_file = "user://highscore.data"


#WHY DOESNT THIS WORK?
#func _ready():
#	score = 0  


func load_highscore():
	var file = File.new()
	
	# Tests to see if the file exists and loads the contents if it does	
	if file.file_exists(score_file):
		file.open(score_file, File.READ)
		var content = file.get_as_text()
		highscore = int(content)
		file.close()


# call this at game end to store a new highscore
func save_highscore():
	var file = File.new()
	file.open(score_file, File.WRITE)
	file.store_string(str(highscore))
	file.close()
