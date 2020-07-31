extends RigidBody2D


 
func _ready():
	set_linear_velocity(Vector2(50,get_linear_velocity().y))


func _physics_process(delta):
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
	$AnimatedSprite.play("Flap")
	set_linear_velocity(Vector2(get_linear_velocity().x,-150))
	set_angular_velocity(-3)
	if not $FlapSound.is_playing():
		$FlapSound.play()
	


func dead():
	if not $FallSound.is_playing():
		$FallSound.play()
	
	#gets a sort of death animation
	set_process_input(false)
	set_pause_mode(PAUSE_MODE_PROCESS)
	$Camera2D.current = false
	$AnimatedSprite.stop()
	
	




#Transition to game over screen
func _on_FallSound_finished():
	get_tree().change_scene("res://UI/GameOverScreen.tscn")
	
