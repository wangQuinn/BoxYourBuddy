extends CharacterBody2D
# Called every frame. 'delta' is the elapsed time since the previous frame.
class_name Player
@onready var camera_2d = $Camera2D

@export var speed = 150
@export var gravity = 30
@export var jump_force = 300 
@export var friction = 600 
@export var maxSpeed = 400
@export var unjump_force = 25 #this is for "variable jumps" 
@export var upGravity = 600
@export var downGravity = 1000
@export var coyote_time = 0.15
func _ready():
	camera_2d.zoom = Vector2(0.9,0.9)
func _process(delta):
	pass
	#if Input.is_action_just_pressed("restart"):
		#get_tree().reload_current_scene()
#
