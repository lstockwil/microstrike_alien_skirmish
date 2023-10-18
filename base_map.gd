extends Control

onready var ctn_side_menu = $ctn_side_menu
onready var ctn_build_facilities= $ctn_build_facilities
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _ready():
	ctn_side_menu.grab_focus()

func _on_btn_build_facilities_pressed():
	ctn_side_menu.hide()
	ctn_build_facilities.show()
