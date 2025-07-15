extends CharacterBody2D
# Called every frame. 'delta' is the elapsed time since the previous frame.

@export var speed = 300
@export var gravity = 30
@export var jump_force = 500 

func _process(delta):
	pass
#
#func _process(_deltdada):
	#if !is_on_floor():
		#if velocity.y > 500: 
			#velocity.y = 500
	#velocity.y += gravity 
	#d
	#if Input.is_action_just_pressed("jump"):
		#velocity.y = -jump_force
		#
	#var horizontal_direction = Input.get_axis("move_left", "move_right")
	#velocity.x = horizontal_direction * speed
	#move_and_slide()
	#
	
	


func _on_animated_sprite_2d_animation_finished():
	pass # Replace with function body.
