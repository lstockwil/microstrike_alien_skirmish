extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var pause_menu = $"."
onready var resume_button = $VBoxContainer/Resume
onready var exit_button = $"VBoxContainer/Exit to Main Menu"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _on_resume_button_pressed():
	#unpause
	var new_stylebox_pressed = resume_button.get_stylebox("pressed").duplicate()
	#resume_button.border_color = Color(0, 1, 0.5)
	resume_button.text = "Resume Pressed!"

	pass

	# Change text

	#label.add_color_override("font_color", Color(0.5, 1, 0.75))

func _on_exit_button_pressed():
	get_tree().change_scene("res://main_menu.tscn")
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
