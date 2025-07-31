extends RigidBody2D

const MOVE_FORCE = 600.0  # how much force to push
const JUMP_FORCE = -600.0  # optional if you want a jump
const MAX_SPEED = 300.0

var velocity = Vector2(0,0)

func _physics_process(delta):
	# Movement: Apply horizontal force
	#var input = Input.get_axis("left", "right")
	#if input != 0:
		#velocity = Vector2(200, -1)
	
	if Input.is_action_pressed("right"):
		apply_torque(18000)  # roll rightc
	if Input.is_action_pressed("left"):
		apply_torque(-18000)   # roll left

	# Optional: Limit speed so it doesn't roll forever
	#if linear_velocity.length() > MAX_SPEED:
		#linear_velocity = linear_velocity.normalized() * MAX_SPEED

	# Jump example (if you want bouncing upwards)
	if Input.is_action_just_pressed("jump"):
		apply_impulse(Vector2(0, JUMP_FORCE))
	#var collision_info = move_and_collide(velocity * delta)
	#if collision_info:
		#velocity = velocity.bounce(collision_info.get_normal())
