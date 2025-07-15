extends State
class_name PlayerMove 

@export var player : CharacterBody2D
@export var playerAnim: AnimatedSprite2D
@export var marker : Marker2D


var hasJumped = false
var was_on_floor = false
var is_attacking = false
var current_animation = "nothing"

func Enter():
	pass
func Exit():
	pass
func Update(_delta: float):
	pass
	
func handle_attack_input():
	if Input.is_action_just_pressed("attack"):
		print("is attacking")
		is_attacking = true
		playerAnim.play("attack")

func _on_animated_sprite_2d_animation_finished():
	is_attacking = false
	

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
	player.velocity.x = horizontal_direction * player.speed
	
	if !is_attacking:
		if(horizontal_direction > 0):
			marker.scale.x = 1
			playerAnim.play("run")
		elif(horizontal_direction < 0):
			marker.scale.x = -1
			playerAnim.play("run")
		
	#horiziontal_direction = 0 when players is not moving. 
	if horizontal_direction == 0 and player.is_on_floor() and !is_attacking:
		Transitioned.emit(self, "PlayerIdle")
		
	handle_attack_input()
	player.move_and_slide()








