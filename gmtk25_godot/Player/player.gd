extends CharacterBody2D


@export var moving_speed = 1000
@export var jump_speed = 1500
@export var gravity = 4000

@export_group("Past_player")
@export var past_1 :PackedScene

#varibale for the record_golem
var record_movement = {}
var time_frame = 0
var starting_position = Vector2(0,0)
var past_player_list = []

#movement
var direction = Vector2(0,0)

func _ready() -> void:
	time_frame = 0
	starting_position = position


func init_loop():
	time_frame = 0
	position = starting_position
	if record_movement.size()>0:
		Spawn_Past_Player()

func _process(delta: float) -> void:
	
	direction = Vector2(0,0)
	
	#left-right
	if Input.is_action_pressed("right"):
		direction.x = 1
	if Input.is_action_pressed("left"):
		direction.x = -1		
	
	velocity.x = moving_speed*direction.x
	#RECORD PART
	record_movement[time_frame]=[velocity,"move"]
	time_frame += 1

	#JUMP
	velocity.y += gravity *delta
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_speed
		#RECORD PART
		record_movement[time_frame]=[velocity,"jump"]
		time_frame += 1

 
	
	move_and_slide()
	
	if Input.is_action_just_pressed("retry"):
		position = starting_position
		record_movement[time_frame]=[velocity,"rock"]
		init_loop()




func Spawn_Past_Player():
	for p in past_player_list:
		p.queue_free()
		past_player_list.erase(p)
	var new_past_player = past_1.instantiate()
	new_past_player.record_movement = record_movement
	new_past_player.position = starting_position
	get_parent().add_child(new_past_player)
	past_player_list.append(new_past_player)
	#currently reinit the save to not have one ghost running trough 5 save 
	record_movement = {}
	
