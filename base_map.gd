extends Control
export var baseName: NodePath
onready var ctn_side_menu = $Panel/ctn_side_menu
onready var ctn_build_facilities= $Panel/ctn_build_facilities
onready var baseInfo= $Panel/BaseInfo
onready var soldierList= $Panel/SoldierList
onready var research= $Panel/ResearchList
onready var production= $Panel/ProductionList
onready var funds= $Panel/ctn_build_facilities/FundAmount
var BASE_SELECTED
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _ready():
	ctn_side_menu.grab_focus()

func _on_btn_build_facilities_pressed():
	ctn_side_menu.hide()
	ctn_build_facilities.show()


func _on_back_pressed():
	visible = false # Replace with function body.


func _on_btn_base_info_pressed():
	ctn_side_menu.hide()
	baseInfo.show()


func _on_BIButton_pressed():
	baseInfo.hide()
	ctn_side_menu.show()


func _on_SLButton_pressed():
	ctn_side_menu.show()
	soldierList.hide()


func _on_btn_soldiers_pressed():
	ctn_side_menu.hide()
	soldierList.show()


func _on_CTNBack_pressed():
	ctn_side_menu.show()
	ctn_build_facilities.hide()


func _on_btn_research_pressed():
	ctn_side_menu.hide()
	research.show()


func _on_btn_resBack_pressed():
	ctn_side_menu.show()
	research.hide()


func _on_btn_production_pressed():
	ctn_side_menu.hide()
	production.show()


func _on_btn_prodBack_pressed():
	ctn_side_menu.show()
	production.hide()

func _on_btn_Startprod_pressed():
	print(BASE_SELECTED)
	BASE_SELECTED.ProductionList.push_front(Production.new("PLACE_HOLDER",0,2))
	var endLength = BASE_SELECTED.ProductionList.size() -1
	production.add_item((BASE_SELECTED.ProductionList[endLength].item_produce)
	+" | Working on: "+String(BASE_SELECTED.ProductionList[endLength].Engineers)
	+" | Finished in: "+String(BASE_SELECTED.ProductionList[endLength].ProduceTime))


func _on_btn_res_pressed():
	print(BASE_SELECTED)
	#BASE_SELECTED.soldierList.push_front(Soldier.new())
	BASE_SELECTED.ResearchList.push_front(Research.new("PLACE_HOLDER",0,2))
	var endLength = BASE_SELECTED.ResearchList.size() -1
	research.add_item((BASE_SELECTED.ResearchList[endLength].TechName)
	+" | Working on: "+String(BASE_SELECTED.ResearchList[endLength].Scientists_Working)
	+" | Finished in: "+String(BASE_SELECTED.ResearchList[endLength].research_time))
