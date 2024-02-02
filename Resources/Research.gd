extends Resource
class_name Research
export(String) var TechName
export(int) var research_time = 0
export(int) var Scientists_Working = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _init(var name,var working, var time):
	TechName = name
	research_time = time
	Scientists_Working = working
	
func researchFinish():
	#add new research 
	#add new item to produce
	pass

