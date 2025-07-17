extends State
class_name PlayerAttack

@export var player: CharacterBody2D
@export var playerAnim: AnimatedSprite2D

func play_attack():
	playerAnim.play("attack")
	
func Enter(data = null):
	if data and data.has("attack"):
		play_attack()

func Exit():
	pass
	
func Update(_delta: float):
	pass

func Physics_Update(_delta: float):
	if !player.is_on_floor():
		#playerAnim.play("fall")
		if player.velocity.y > 500: 
			player.velocity.y = 500
		player.velocity.y += player.gravity
	var horizontal_direction = Input.get_axis("move_left", "move_right")
	player.velocity.x = horizontal_direction * player.speed
	player.move_and_slide()
		
func _on_animated_sprite_2d_animation_finished():
	if Input.get_axis("move_left", "move_right") == 0:
		Transitioned.emit(self, "PlayerIdle")
	elif Input.get_axis("move_left", "move_right") != 0:
		Transitioned.emit(self, "PlayerMove")
