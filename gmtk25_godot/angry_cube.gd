extends CharacterBody2D

@export var moving_speed = 000
@export var jump_speed = 1500
@export var gravity = 50
#@export var player: Node2D
var alive = true
var starting_position = Vector2(0,0)


func _physics_process(delta: float) -> void:
	velocity.y += gravity
	move_and_slide()
