extends Node


const SCREEN_WIDTH = 144
const SCREEN_HEIGHT = 256
const PIPE = preload("res://Pipes.tscn")
const HORISONTAL_OFFSET = 100
const VERTICAL_OFFSET = 50
const GROUND_HEIGHT = 55

var random = RandomNumberGenerator.new()
var pipe_generator_position = Vector2()
var pipe_counter = 0


func _ready():
	random.randomize()
	pipe_generator_position = Vector2(SCREEN_WIDTH + PIPE.instance().WIDTH/2, random.randi_range(VERTICAL_OFFSET, SCREEN_HEIGHT - (GROUND_HEIGHT + VERTICAL_OFFSET)))
	get_tree().paused = true

func _process(_delta):
	if pipe_counter != 3:
		var pipe = PIPE.instance()
		$PipeGenerator.set_position(pipe_generator_position)
		pipe.position = $PipeGenerator.position
		add_child(pipe)
		pipe_generator_position.x += HORISONTAL_OFFSET
		pipe_generator_position.y = random.randi_range(VERTICAL_OFFSET, SCREEN_HEIGHT - (GROUND_HEIGHT + VERTICAL_OFFSET))
		pipe_counter+=1






func _on_InstructionScreenButton_pressed():
	get_tree().paused = false
	$InstructionScreenButton.visible = false
