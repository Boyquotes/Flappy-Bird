extends CanvasLayer



func _ready():
	$AnimationPlayer.get_animation("Flying").set_loop(true)
	$AnimationPlayer.play("Flying")


func _on_TutorialScreenButton_pressed():
	get_tree().change_scene("res://Stage.tscn")
