extends CanvasLayer


var current_shake_priority = 0


func move_camera(vector):
	get_parent().get_node("Bird").get_node("Camera2D").offset = Vector2(rand_range(-vector.x,vector.x), rand_range(-vector.y,vector.y))


func screen_shake(shake_length, shake_power, shake_priority):
	if shake_priority > current_shake_priority:
		current_shake_priority = shake_priority
		$Tween.interpolate_method(self, "move_camera",Vector2(shake_power,shake_power), Vector2(0,0), shake_length, $Tween.TRANS_SINE, $Tween.EASE_OUT,0)
		$AnimationPlayer.play("WhiteFadeOut")
		$Tween.start()

