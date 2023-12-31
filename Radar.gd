extends Node2D
var drone_scene: PackedScene = preload("res://Drone.tscn")
var gameplay_scene = preload("res://Gameplay.tscn").instance()
signal detected
signal exit
var rotation_speed = 0

func _ready():
#	 $Drone.hide()
	 $Spawn_Timer.start()
	 
	


func rotate_RadarLine(delta):
	$Radar/RadarLine.set_rotation(deg2rad(rotation_speed*delta))
	rotation_speed+=50
	

func _process(delta):
	rotate_RadarLine(delta)
	


func _on_Spawn_Timer_timeout():
	spawn_drone()	
	
func spawn_drone():
	var new_drone = drone_scene.instance()
	var screen_size = get_viewport_rect().size
	new_drone.position.x = rand_range(-45,3165)
	new_drone.position.y = rand_range(-564,1246)
	new_drone.scale = Vector2(0.25,0.25)
	$Incoming_Drone.add_child(new_drone)
	new_drone.hide()


func _on_Radar_body_entered(body):
	#print('Drone detected')
	body.show()
	emit_signal("detected",body)
	#for child in $Incoming_Drone.get_children():
	#	child.show()
	#get_tree().root.add_child(gameplay_scene)
	#hide()


func _on_Radar_body_exited(body):
	emit_signal("exit",body)
	body.hide()
