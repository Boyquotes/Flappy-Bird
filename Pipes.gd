extends StaticBody2D


const WIDTH = 26

func get_width():
	return WIDTH


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	get_parent().pipe_counter -= 1


func _on_Area2D_body_entered(body):
	if "Bird" in body.name:
		Global.score += 1
		get_parent().get_node("CanvasLayer/VBoxContainer/Score").text = str(Global.score)
		if not $PointSound.is_playing():
			$PointSound.play()


func _on_Pipes_body_entered(body):
	if "Bird" in body.name:
		if not $HitPipesSound.is_playing():
			$HitPipesSound.play()
		body.dead()
