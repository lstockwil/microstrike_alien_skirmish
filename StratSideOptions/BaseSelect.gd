extends Button
export var MAIN_PATH : NodePath
export(NodePath) var BASE_MAP
export(NodePath) var BASE_SELECTED
signal pause_game
#onready var base = get_node(BASE_SELECTED)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	 pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	var temp = get_node(BASE_MAP)
	var nameTemp = temp.get_child(0).get_child(1).get_child(0)
	nameTemp.text = text
	temp.BASE_SELECTED = BASE_SELECTED
	#get Base items and personal list
	var baseList = temp.get_child(0).get_child(3)
	var soldierList = temp.get_child(0).get_child(4)
	var resList = temp.get_child(0).get_child(5)
	var prodList = temp.get_child(0).get_child(6)
	temp.funds.text = "$"+String(get_node("../../../..").funds)
	#clear list before adding items
	baseList.clear()
	soldierList.clear()
	resList.clear()
	prodList.clear()
	#print(baseList.get_item_count())
	baseList.add_item("Scientists: "+String(BASE_SELECTED.scientists))
	baseList.add_item("Engineers: "+String(BASE_SELECTED.engineers))
	baseList.add_item("Fighter Craft: "+String(BASE_SELECTED.fighters))
	
	for n in BASE_SELECTED.inventoryList.size():
		baseList.add_item("Item "+String(n)+": "+String(BASE_SELECTED.inventoryList[n]))
		
	for n in BASE_SELECTED.soldierList.size():
		soldierList.add_item((BASE_SELECTED.soldierList[n].Name) 
		+" | Rank: "+BASE_SELECTED.soldierList[n].Rank
		+" | Aim: "+String(BASE_SELECTED.soldierList[n].Aim))	
	
	for n in BASE_SELECTED.ProductionList.size():
		prodList.add_item((BASE_SELECTED.ProductionList[n].item_produce)
	+" | Working on: "+String(BASE_SELECTED.ProductionList[n].Engineers)
	+" | Finished in: "+String(BASE_SELECTED.ProductionList[n].ProduceTime))
	
	for n in BASE_SELECTED.ResearchList.size():
		resList.add_item((BASE_SELECTED.ResearchList[n].TechName)
	+" | Working on: "+String(BASE_SELECTED.ResearchList[n].Scientists_Working)
	+" | Finished in: "+String(BASE_SELECTED.ResearchList[n].research_time))
	
	temp.visible = true
	
