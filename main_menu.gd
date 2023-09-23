extends Control


# This script demonstrates how to alter StyleBoxes at runtime.
# Custom theme item properties aren't considered Object properties per se.
# This means that you should use `add_stylebox_override("normal", ...)`
# instead of `set("custom_styles/normal", ...)`.

onready var label = $StartScreen/Label
onready var start_button = $StartScreen/StartButton
onready var settings_button = $StartScreen/SettingsButton
onready var exit_button = $StartScreen/ExitButton



onready var startscreen_buttons = [start_button, settings_button, exit_button]

# Save the label color so it can be reset.
#var default_label_color = label.get_color("font_color")


func _ready():
	# Focus the first button automatically for keyboard/controller-friendly navigation.
	start_button.grab_focus()


func _on_start_button_pressed():
	# We have to modify the normal, hover and pressed styleboxes all at once
	# to get a correct appearance when the button is hovered or pressed.
	# We can't use a single StyleBox for all of them as these have different
	# background colors.
	var new_stylebox_normal = start_button.get_stylebox("normal").duplicate()
	new_stylebox_normal.border_color = Color(1, 1, 0)
	
	var new_stylebox_hover = start_button.get_stylebox("hover").duplicate()
	new_stylebox_hover.border_color = Color(1, 1, 0)
	
	var new_stylebox_pressed = start_button.get_stylebox("pressed").duplicate()
	new_stylebox_pressed.border_color = Color(1, 1, 0)
	
	
	
	start_button.add_stylebox_override("normal", new_stylebox_normal)
	start_button.add_stylebox_override("hover", new_stylebox_hover)
	start_button.add_stylebox_override("pressed", new_stylebox_pressed)
	
	# Change text
	var new_text = "You pressed Start!"
	start_button.text = new_text
	
	label.add_color_override("font_color", Color(1, 1, 0.5))


func _on_settings_button_pressed():
	var new_stylebox_normal = settings_button.get_stylebox("normal").duplicate()
	new_stylebox_normal.border_color = Color(0, 1, 0.5)
	var new_stylebox_hover = settings_button.get_stylebox("hover").duplicate()
	new_stylebox_hover.border_color = Color(0, 1, 0.5)
	var new_stylebox_pressed = settings_button.get_stylebox("pressed").duplicate()
	new_stylebox_pressed.border_color = Color(0, 1, 0.5)

	# Change text
	var new_text = "You pressed Settings!"
	settings_button.text = new_text

	settings_button.add_stylebox_override("normal", new_stylebox_normal)
	settings_button.add_stylebox_override("hover", new_stylebox_hover)
	settings_button.add_stylebox_override("pressed", new_stylebox_pressed)

	label.add_color_override("font_color", Color(0.5, 1, 0.75))
	
func _on_exit_button_pressed():
#	var new_stylebox_normal = mult_button.get_stylebox("normal").duplicate()
#	new_stylebox_normal.border_color = Color(0, 1, 0.5)
#	var new_stylebox_hover = mult_button.get_stylebox("hover").duplicate()
#	new_stylebox_hover.border_color = Color(0, 1, 0.5)
#	var new_stylebox_pressed = mult_button.get_stylebox("pressed").duplicate()
#	new_stylebox_pressed.border_color = Color(0, 1, 0.5)
	get_tree().quit()
	# Change text
#	var new_text = "You pressed Sub"
#	mult_button.text = new_text
#
#	mult_button.add_stylebox_override("normal", new_stylebox_normal)
#	mult_button.add_stylebox_override("hover", new_stylebox_hover)
#	mult_button.add_stylebox_override("pressed", new_stylebox_pressed)
#
#	label.add_color_override("font_color", Color(0.5, 1, 0.75))
	


#func _on_reset_functions_button_pressed():
#	# Resetting a theme override is done by setting the property to:
#	# - `null` for fonts, icons, styleboxes, and shaders.
#	# - `0` for constants.
#	# - Colors must be reset manually by adding the previous color value as an override.
#	for button in function_buttons:	
#		button.add_stylebox_override("normal", null)
#		button.add_stylebox_override("hover", null)
#		button.add_stylebox_override("pressed", null)
#
#	label.add_color_override("font_color", default_label_color)
