extends State
class_name PlayerMove 

@export var player : CharacterBody2D
@export var playerAnim: AnimatedSprite2D
@export var marker : Marker2D


var hasJumped = false
var was_on_floor = false
var current_animation = "nothing"

func Enter(data = null):
	if data and data.has("jump"):
		player.velocity.y = -player.jump_force
		
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
	
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		playerAnim.play("jump")
		hasJumped = true
		player.velocity.y = -player.jump_force
		
	var horizontal_direction = Input.get_axis("move_left", "move_right")
	
	player.velocity.x += horizontal_direction * player.speed * _delta
	#cap velocity.x
	if player.velocity.x > player.maxSpeed: 
		print("reach velocity of 500")
		player.velocity.x = player.maxSpeed
	
	# apply friction so turning feels less floaty? 
	if sign(player.velocity.x) != sign(horizontal_direction): 
		player.velocity.x -= -1 * horizontal_direction * player.friction * _delta

	if(horizontal_direction > 0):
		marker.scale.x = 1
		playerAnim.play("run")
	elif(horizontal_direction < 0):
		marker.scale.x = -1
		playerAnim.play("run")
		
	player.move_and_slide()
	#horiziontal_direction = 0 when players is not moving. 
	#for this game they should never be able to idle after beginning? 
	#if horizontal_direction == 0 and player.is_on_floor():
		#Transitioned.emit(self, "PlayerIdle")
	
	if Input.is_action_just_pressed("attack"):
		Transitioned.emit(self, "PlayerAttack", {"attack": true})

	








