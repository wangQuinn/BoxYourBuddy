extends State
class_name PlayerIdle

#should only be idling at the start of every level

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
	if !player.is_on_floor():
		playerAnim.play("fall")
		if player.velocity.y > 500:  
			player.velocity.y = 500
		player.velocity.y += player.gravity
		player.move_and_slide()
	if Input.is_action_pressed("jump"):
		Transitioned.emit(self, "PlayerMove", {"jump": true})
		
	elif Input.is_action_just_pressed("attack"):
		Transitioned.emit(self, "PlayerAttack", {"attack": true})
		
	elif Input.get_axis("move_left", "move_right") != 0:
		Transitioned.emit(self, "PlayerMove")
