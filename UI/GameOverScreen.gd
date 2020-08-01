extends Node

 
var gameoverScore = 0

 
func _ready():
	$VBoxContainer/AnimationPlayer.play("GameOverFadeIn")
	
	#Save new highscore
	if Global.score > Global.highscore:
		Global.highscore = Global.score
		Global.save_highscore()


func _on_Timer_timeout():
	if not $VBoxContainer/AnimationPlayer.is_playing():
		$VBoxContainer/TextureRect2/VBoxContainer.visible = true
		
		#COUNTING SCORE EFFECT
		if gameoverScore != Global.score:
			gameoverScore += 1
			$VBoxContainer/TextureRect2/VBoxContainer/Score.text = str(gameoverScore)
		else:
			$VBoxContainer/TextureRect2/VBoxContainer/HighScore.text = str(Global.highscore)



func _on_PlayButton_pressed():
	get_tree().change_scene("res://UI/TutorialScreen.tscn")



