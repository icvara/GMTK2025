extends CharacterBody2D


@export var moving_speed = 1000
@export var jump_speed = 1500
@export var gravity = 4000



func _ready() -> void:
	pass

func _process(delta: float) -> void:
	
		
	velocity.y += gravity *delta

	move_and_slide()
	
