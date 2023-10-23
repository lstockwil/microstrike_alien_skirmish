extends Control
export var baseName: NodePath
onready var ctn_side_menu = $Panel/ctn_side_menu
onready var ctn_build_facilities= $Panel/ctn_build_facilities
onready var baseInfo= $Panel/BaseInfo
onready var soldierList= $Panel/SoldierList
onready var research= $Panel/ResearchList
onready var production= $Panel/ProductionList
onready var funds= $Panel/ctn_build_facilities/FundAmount
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

