extends Node2D
export var MAIN : NodePath
export var base = []
export(String) var baseName
export var inventoryList = []
export var soldierList = []
# includes soldier + engineers + scientists
export(int) var MAX_PERSONAL = 25
export(int) var MAX_FIGHTERS = 0
export(int) var MAX_RADAR = 0
export(int) var scientists = 0
export(int) var engineers = 0
export(int) var fighters = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func time_event():
	print("Timep passed")
# Called when the node enters the scene tree for the first time.
func _ready():
	var main = get_node(MAIN)
	main.connect("time_passed", self, "time_event")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
