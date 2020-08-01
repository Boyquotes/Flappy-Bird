extends StaticBody2D


const WIDTH = 26

func _ready():
	get_parent().get_node("ScreenShake").get_node("Tween").connect("tween_completed", self, "on_tween_completed")


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	get_parent().pipe_counter -= 1


func _on_Area2D_body_entered(body):
	if "Bird" in body.name:
		Global.score += 10
		get_parent().get_node("CanvasLayer/VBoxContainer/Score").text = str(Global.score)
		if not $PointSound.is_playing():
			$PointSound.play()


func _on_Pipes_body_entered(body):
	if "Bird" in body.name:
		if not $HitPipesSound.is_playing():
			$HitPipesSound.play()
			
			#shake effect
			get_parent().get_node("ScreenShake").screen_shake(0.3,10,100)
			
#		body.dead()


func on_tween_completed(object, key):
	get_parent().get_node("Bird").dead()


