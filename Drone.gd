extends KinematicBody2D
signal laser(pos,direction)

var can_laser = false
var speed = 100
var health = 50

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#position of player minus enemy position will give us direction
	look_at(Globals.player_pos)
	$Drone_image.rotation_degrees = 90
	var player_position = Globals.player_pos
	var target_position = (player_position - global_position).normalized()
	var laser_position = $Laser_Position.global_position
	Globals.drone_laser_pos = $Laser_Position.global_position
	
	
	if can_laser:
		emit_signal("laser", laser_position, target_position)
		can_laser = false
		$Laser_Timer.start()
		


func _physics_process(delta):
	var player_position = Globals.player_pos
	var target_position = (player_position - position).normalized()
	
	if position.distance_to(player_position) > 250:
		move_and_slide(target_position * speed)
		
	else: 
		move_and_slide(target_position * -speed)
#		move_random_direction()
	


func _on_Laser_Timer_timeout():
	can_laser = true
	
	
func die():
	$AnimationPlayer.play("Explosion")
	$Laser_Timer.stop()

func hit():
	health-=10
	if health<=0:
		die()
