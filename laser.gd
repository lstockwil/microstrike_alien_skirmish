extends Area2D

var speed: int = 1000
var direction: Vector2 = Vector2.UP

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direction * speed * delta
	


func _on_laser_body_entered(body):
	if "hit" in body:
		print("Drone hit")
		body.hit()
	queue_free()
