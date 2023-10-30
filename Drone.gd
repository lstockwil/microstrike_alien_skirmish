extends KinematicBody2D
signal laser(pos,direction)

var can_laser = false
var speed = 100
var health = 50
var startPoint
var endPoint
var moveDirection = -1
var time = 0
func _ready():
	startPoint =self.global_position
	var rndX = rand_range(-45,3165)
	var rndY = rand_range(-564,1246)
	endPoint = Vector2(rndX, rndY)
	print(endPoint,startPoint)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#position of player minus enemy position will give us direction
	$Drone_image.look_at(Globals.player_pos)
	$Drone_image.rotation_degrees += 90
	var player_position = Globals.player_pos
	var target_position = (player_position - position).normalized()
	var laser_position = $Laser_Position.global_position
	Globals.drone_laser_pos = $Laser_Position.global_position
	if can_laser:
		emit_signal("laser", laser_position, target_position)
		can_laser = false
		$Laser_Timer.start()
		


func _physics_process(delta):
	time += delta * moveDirection
	var t = time / 50
	self.global_position = lerp(startPoint, endPoint, t)
	#var player_position = Globals.player_pos
	#var target_position = (player_position - position).normalized()
	#move_and_slide(target_position * speed)
	#if position.distance_to(player_position) > 250:
		
		
	#else: 
		#move_and_slide(target_position * -speed)
#		move_random_direction()
	


func _on_Laser_Timer_timeout():
	can_laser = true
	
	


func _on_MissionTimer_timeout():
	queue_free() # Replace with function body.
