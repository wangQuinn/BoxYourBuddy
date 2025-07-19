extends Node2D

@onready var timer =  $CanvasLayer/TimerLabel
# Called when the node enters the scene tree for the first time.
@onready var player = $Player
@onready var door = $Door

var time = 0.0
var isTimeRunning = true
func _ready():
	door.level_finished.connect(finish_level)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if isTimeRunning:
		time += delta
		
		timer.text = "%.2f" % time
	
	if Input.is_action_pressed("restart"):
		get_tree().reload_current_scene()
		time = 0.0
func finish_level():
	isTimeRunning = false
	
	print("YOU Won")
	Highscores.highscores[0] = time
	get_tree().change_scene_to_file("res://LevelSelect.tscn")
