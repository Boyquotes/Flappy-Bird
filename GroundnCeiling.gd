extends StaticBody2D


 

func _on_CeilingArea_body_entered(body):
	if "Bird" in body.name:
		body.set_linear_velocity(Vector2(50,body.get_linear_velocity().y))


func _on_GroundArea_body_entered(body):
	if "Bird" in body.name:
		body.dead()
