extends Node

 

 
func _ready():
	$VBoxContainer/AnimationPlayer.play("GameOverFadeIn")
	
	#Save new highscore
	if Global.score > Global.highscore:
		Global.highscore = Global.score
		Global.save_highscore()

func _process(_delta):
	if not $VBoxContainer/AnimationPlayer.is_playing():
		$VBoxContainer/TextureRect2/VBoxContainer.visible = true
		$VBoxContainer/TextureRect2/VBoxContainer/Score.text = str(Global.score)
		$VBoxContainer/TextureRect2/VBoxContainer/HighScore.text = str(Global.highscore)


func _on_PlayButton_pressed():
	get_tree().change_scene("res://Stage.tscn")
