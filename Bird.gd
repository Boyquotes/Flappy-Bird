extends RigidBody2D

 

 
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	$AnimatedSprite.play("Flap")
	#When facing up stay at -30 degrees
	if get_rotation_degrees() <= -30:
		set_rotation_degrees(-30)
		set_angular_velocity(0)
	
	
	#when falling rotate towards 60 degrees
	if get_linear_velocity().y > 0:
		set_angular_velocity(1.5)
		
		#Stay at 60 degrees
		if get_rotation_degrees() >= 60:
			set_rotation_degrees(60)
			set_angular_velocity(0)


func _input(event):
	if event is InputEventMouseButton:
		flap()



func flap():
	set_linear_velocity(Vector2(0,-150))
	set_angular_velocity(-3)




