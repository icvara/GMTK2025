

extends CharacterBody2D

# Custom gravity value
var gravity = 1000

# Movement speed variables
var speed = 200.0
var jump_velocity = -400.0
var camera_existing = true

func _ready():
	var camera_existing = true

func _physics_process(delta):
	move_and_slide()
	# Apply gravity
	if not is_on_floor():
		velocity.y += gravity * delta

	# Movement input
	var direction = Input.get_axis("left", "right")
	velocity.x = direction * speed

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity 

	if Input.is_action_pressed("BecomingStone"):
		gravity =0
		velocity.y = 0
		speed = 0
		var new_texture = load("res://Assets/player_bloc1.png")
		$TextureRect.texture = new_texture
		if camera_existing == true :
			#this needs to deactivate camera for new player to have camera, doesnt work yet
			#$Camera2D.current = false
			camera_existing = false
