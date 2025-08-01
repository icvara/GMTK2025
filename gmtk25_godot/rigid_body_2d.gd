extends RigidBody2D

@export var move_force := 100000.0
@export var max_speed := 200.0
@export var jump_impulse := -500.0

@onready var ground_check = $RayCast2D

func _physics_process(delta: float) -> void:
	
	var input_dir = Input.get_action_strength("right") - Input.get_action_strength("left")
	
	if abs(linear_velocity.x) < max_speed:
		apply_central_force(Vector2(input_dir * move_force, 0))
		
	if Input.is_action_just_pressed("jump") and ground_check.is_colliding():
		apply_central_impulse(Vector2(0, jump_impulse))
