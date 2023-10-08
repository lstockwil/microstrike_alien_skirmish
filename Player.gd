extends KinematicBody2D

signal laser(pos,direction)
	
var speed: int = 500
var can_laser: bool = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var velocity = direction * speed
	move_and_slide(velocity)
	Globals.player_pos = $Player_image.global_position
	
	
	#rotate player
	look_at(get_global_mouse_position())
	var player_direction = (get_global_mouse_position() -position).normalized()
	if Input.is_action_pressed("Shoot_laser") and can_laser:
		var laserPosition = $LaserStartPositions
		can_laser = false
		$Laser_timer.start()
		emit_signal("laser", laserPosition.global_position, player_direction)
func _on_Timer_timeout():
	can_laser = true



	
