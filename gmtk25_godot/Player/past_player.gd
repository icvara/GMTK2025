extends CharacterBody2D


@export var moving_speed = 1000
@export var jump_speed = 1500
@export var gravity = 4000


#varibale for the record_golem
var record_movement = {}
var time_frame = 0
var alive = true
var past_id = 1

var max_time = 5
var starting_position = Vector2(0,0)

func _ready() -> void:
	$Timer.start(max_time)
	time_frame = 0
	$Label.text = str(past_id)
	await get_tree().create_timer(1.).timeout	
	set_collision_layer_value(1,true)
	set_collision_layer_value(2,true)

	
func _process(delta: float) -> void:
	if alive:
		if time_frame < record_movement.size():
			velocity.x = record_movement[time_frame][0].x
			
			if record_movement[time_frame][1]=="jump" and is_on_floor():
				velocity.y = record_movement[time_frame][0].y

			
			if record_movement[time_frame][1]=="rock":
				Transform_in_rock()
				
		else:
			velocity.x = 0
			
		velocity.y += gravity *delta

		move_and_slide()
		time_frame += 1
	
func Transform_in_rock():
	$Sprite2D.hide()
	$Sprite2D_block.show()
	set_collision_layer_value(1,true)


func Kill():
	alive = false
	modulate = Color(1,1,1,0.2)

	
func init_past_loop():
	time_frame = 0
	$Timer.start(max_time)
	position = starting_position
	set_collision_layer_value(1,false)
	set_collision_layer_value(2,false)

	await get_tree().create_timer(1.).timeout	
	set_collision_layer_value(1,true)
	set_collision_layer_value(2,true)


func _on_timer_timeout() -> void:
	init_past_loop()
