extends State
class_name PlayerIdle

@export var player: CharacterBody2D
@export var playerAnim: AnimatedSprite2D
func play_idle():
	playerAnim.play("idle")

func Enter(data = null):
	play_idle() 

func Exit():
	pass

func Update(_delta: float):
	pass

func Physics_Update(_delta: float):
	#if not player.is_on_floor():
		#Transitioned.emit(self, "PlayerJump")
		#return
	if Input.is_action_pressed("jump"):
		Transitioned.emit(self, "PlayerMove", {"jump": true})
		
	elif Input.get_axis("move_left", "move_right") != 0:
		Transitioned.emit(self, "PlayerMove")
