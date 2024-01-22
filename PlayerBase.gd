extends Node2D
export var MAIN : NodePath
export var base = []
export(String) var baseName
export var inventoryList = []
export var soldierList = []
export var ResearchList = []
export var ProductionList = []
export var RadarList = []
# includes soldier + engineers + scientists
export(int) var MAX_PERSONAL = 25
export(int) var MAX_FIGHTERS = 0
export(int) var WKS_COUNT = 0
export(int) var WKS_IN_USE = 0
export(int) var LAB_COUNT = 0
export(int) var LAB_IN_USE = 0
export(int) var MAX_RADAR = 0
export(int) var scientists = 0
export(int) var engineers = 0
export(int) var fighters = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func radar_update(UFO):
	RadarList.append(UFO)
	var targets = $"../../../UI_Elements/fighterList"
	for n in RadarList.size():
		targets.add_item(RadarList[n].name) 
func radar_remove(UFO):
	var targets = $"../../../UI_Elements/fighterList"
	for n in RadarList.size()-1:
		if(RadarList[n].name == targets[n].name):
			targets.remove(n)
			print(targets[n].name)
	RadarList.erase(UFO)
func time_event():
	print(ResearchList.size())
# Called when the node enters the scene tree for the first time.
func _ready():
	$Name.text = baseName
	var main = get_node(MAIN)
	var radar = $RadarScene
	main.connect("time_passed", self, "time_event")
	radar.connect("detected",self,"radar_update")
	radar.connect("exit",self,"radar_remove")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
