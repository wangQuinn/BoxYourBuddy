extends State
class_name PlayerMove 

@export var player : CharacterBody2D
@export var playerAnim: AnimatedSprite2D

func Enter():
	pass
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
	
	if Input.is_action_just_pressed("jump"):
		playerAnim.play("jump")
		player.velocity.y = -player.jump_force
		
	var horizontal_direction = Input.get_axis("move_left", "move_right")
	player.velocity.x = horizontal_direction * player.speed
	
	if(horizontal_direction > 0):
		playerAnim.flip_h = false
		playerAnim.play("run")
	elif(horizontal_direction < 0):
		playerAnim.flip_h = true
		playerAnim.play("run")
		
	player.move_and_slide()
	
	#horiziontal_direction = 0 when players is not moving. 
	if horizontal_direction == 0 and player.is_on_floor():
		Transitioned.emit(self, "PlayerIdle")
