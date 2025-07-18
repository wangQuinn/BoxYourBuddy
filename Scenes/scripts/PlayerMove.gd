extends State
class_name PlayerMove 

@export var player : CharacterBody2D
@export var playerAnim: AnimatedSprite2D
@export var marker : Marker2D
@export var camera : Camera2D




var camera_target = 64.0
var current_animation = "nothing"

func Enter(data = null):
	if data and data.has("jump"):
		player.velocity.y = -player.jump_force
		
func Exit():
	pass
func Update(_delta: float):
	pass
func Physics_Update(_delta: float):
	#parabolic jump up and faster falling down = snappy!
	if !player.is_on_floor():
		playerAnim.play("fall")
		
		if player.velocity.y > 0:
			player.velocity.y += player.downGravity * _delta
		else:
			player.velocity.y += player.upGravity * _delta
	
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		playerAnim.play("jump")
		player.velocity.y = -player.jump_force
	if Input.is_action_just_released("jump"):
			player.velocity.y = player.unjump_force
	
		
	var horizontal_direction = Input.get_axis("move_left", "move_right")
	
	player.velocity.x = move_toward(player.velocity.x, player.maxSpeed, horizontal_direction * player.speed * _delta)
	print(" velocity of " + str(player.velocity.x))
	#cap velocity.x
	if abs(player.velocity.x) > player.maxSpeed: #if it reaches max speed apply friction 
		print("reach velocity of " + str(player.maxSpeed))
		player.velocity.x = move_toward(player.velocity.x, player.maxSpeed, -1 * horizontal_direction * player.friction * _delta)
	
	# apply friction so turning feels less floaty? 
	if sign(player.velocity.x) != sign(horizontal_direction): 
		player.velocity.x -= -1 * horizontal_direction * player.friction * _delta
		

	if(horizontal_direction > 0):
		marker.scale.x = 1
		camera_target = 64
		playerAnim.play("run")
	elif(horizontal_direction < 0):
		marker.scale.x = -1
		camera_target = -64
		playerAnim.play("run")
	else:
		player.velocity.x -= sign(player.velocity.x) * player.friction * _delta
		
		
	player.move_and_slide()
	#smooths the camera, change the number for smoother
	camera.offset.x = lerp(camera.offset.x, float(camera_target), 1.5* _delta)

	#horiziontal_direction = 0 when players is not moving. 
	#for this game they should never be able to idle after beginning? 
	#if horizontal_direction == 0 and player.is_on_floor():
		#Transitioned.emit(self, "PlayerIdle")
	
	if Input.is_action_just_pressed("attack"):
		Transitioned.emit(self, "PlayerAttack", {"attack": true})

	








