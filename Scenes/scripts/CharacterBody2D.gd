extends CharacterBody2D
# Called every frame. 'delta' is the elapsed time since the previous frame.

@export var speed = 300
@export var gravity = 30
@export var jump_force = 300

func _process(_delta):
	if !is_on_floor():
		if velocity.y > 500: 
			velocity.y = 500
	#velocity.y += gravity 
	
	if Input.is_action_just_pressed("jump"):
		velocity.y = -jump_force
		
	var horizontal_direction = Input.get_axis("move_left", "move_right")
	velocity.x = horizontal_direction * speed
	move_and_slide()
	
	
	
