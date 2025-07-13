extends State
class_name PlayerIdle

@export var player: CharacterBody2D
@export var playerAnim: AnimatedSprite2D
func play_idle():
	playerAnim.play("idle")

func Enter():
	play_idle() 

func Exit():
	pass

func Update(_delta: float):
	if Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		Transitioned.emit(self, "PlayerMove")
		return
	if Input.is_action_just_pressed("jump"):
		playerAnim.play("jump")
		player.velocity.y = -player.jump_force
		Transitioned.emit(self, "PlayerMove")
		return
	

func Physics_Update(_delta: float):
	pass
