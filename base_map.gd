extends Control
export var baseName: NodePath
onready var ctn_side_menu = $Panel/ctn_side_menu
onready var ctn_build_facilities= $Panel/ctn_build_facilities
onready var baseInfo= $Panel/BaseInfo
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
