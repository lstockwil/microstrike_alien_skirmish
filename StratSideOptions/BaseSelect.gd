extends Button
export var MAIN_PATH : NodePath
export(NodePath) var BASE_MAP
export(NodePath) var BASE_SELECTED
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
	
	#get Base items and personal list
	var baseList = temp.get_child(0).get_child(3)
	var soldierList = temp.get_child(0).get_child(4)
	temp.funds.text = "$"+String(get_node("../../../..").funds)
	#clear list before adding items
	baseList.clear()
	soldierList.clear()
	#print(baseList.get_item_count())
	baseList.add_item("Scientists: "+String(BASE_SELECTED.scientists))
	baseList.add_item("Engineers: "+String(BASE_SELECTED.engineers))
	baseList.add_item("Fighter Craft: "+String(BASE_SELECTED.fighters))
	for n in BASE_SELECTED.inventoryList.size():
		baseList.add_item("Item "+String(n)+": "+String(BASE_SELECTED.inventoryList[n]))
		
	for n in BASE_SELECTED.soldierList.size():
		soldierList.add_item(String(BASE_SELECTED.soldierList[n])+" | Rookie"+"| Aim: 50")	
	
	
	temp.visible = true
	
