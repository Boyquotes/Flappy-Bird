extends StaticBody2D


const WIDTH = 26

func get_width():
	return WIDTH


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	get_parent().pipe_counter -= 1
