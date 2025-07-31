extends CharacterBody2D


@export var moving_speed = 1000
@export var jump_speed = 1500
@export var gravity = 4000


#varibale for the record_golem
var record_movement = {}
var time_frame = 0


func _ready() -> void:
	time_frame = 0

func _process(delta: float) -> void:
	
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
