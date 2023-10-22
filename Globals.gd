extends Node


onready var player_pos:Vector2
onready var drone_laser_pos

func _ready():
	get_tree().change_scene("res://main_menu.tscn")
	print_tree()
