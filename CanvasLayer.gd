extends CanvasLayer

 

var side_menu : Panel

var ufo_pedia : RichTextLabel

var is_menu_open : bool = false

 

func _ready():

	side_menu = $Panel

	ufo_pedia = $Panel/VBoxContainer/RichTextLabel

	hide_menu()

 

func _on_Button_pressed():

	is_menu_open = not is_menu_open

	if is_menu_open:

		show_menu()

	else:

		hide_menu()

 

func show_menu():

	side_menu.rect_min_size = Vector2(300, side_menu.rect_min_size.y)

	ufo_pedia.bbcode_text = "[center][b]UFOpedia[/b][/center]\n\n"

	ufo_pedia.bbcode_text += "1. **Zarvox the Tactician**\n   - Species: Zentari\n   - Description: Zarvox is a high-ranking Zentari officer known for his strategic brilliance. With blue, luminescent skin and multiple eyestalks, he towers over his subordinates. He commands the Zentari fleet with cunning precision and is a mastermind when it comes to devising tactical maneuvers.\n\n"

	ufo_pedia.bbcode_text += "2. **Lunastra the Diplomat**\n   - Species: Celestix\n   - Description: Lunastra is a graceful and enigmatic Celestix diplomat with shimmering, ethereal wings that emit a soft, calming light. She plays a crucial role in interstellar negotiations and is known for her ability to find peaceful solutions to conflicts, even in the face of adversity."

	side_menu.show()

 

func hide_menu():

	side_menu.rect_min_size = Vector2(0, side_menu.rect_min_size.y)

	side_menu.hide()
