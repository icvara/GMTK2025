extends CharacterBody2D

@export var max_jump_time: float = 0.25  # seconds you can hold jump
var jump_time: float = 0.0
var is_jumping: bool = false
@export var moving_speed = 1000
@export var jump_speed = 750
@export var gravity = 4000
@export_range(0.0,1.0) var friction = 0.1
@export_range(0.0,1.0) var acceleration = 0.25
@export var bounce_strength = 8

var max_velocity = 2000

var projectile :PackedScene


#varibale for the record_golem
var record_movement = {}
var time_frame = 0
var alive = true
var past_id = 1
var isdashing = false

var max_time = 5
var starting_position = Vector2(0,0)

func _ready() -> void:
	$Timer.start(max_time)
	time_frame = 0
	$Label.text = str(past_id)
	await get_tree().create_timer(1.).timeout	
	set_collision_layer_value(1,true)
	set_collision_layer_value(2,true)

	
func _physics_process(delta: float) -> void:
	if alive:
		if time_frame < record_movement.size():
			if isdashing==false:
				velocity.y += gravity *delta

				velocity.x = record_movement[time_frame][0].x
				
				if record_movement[time_frame][1]=="jump" and is_on_floor():
					is_jumping = true
					jump_time = 0.0		
				if is_jumping and record_movement[time_frame][1]=="jump" and jump_time < max_jump_time:
					velocity.y = -jump_speed #record_movement[time_frame][0].y
					jump_time += delta
					print(velocity.y )
				elif record_movement[time_frame][1]!="jump":
					is_jumping = false


				
				if record_movement[time_frame][1]=="rock":
					Transform_in_rock()

				if record_movement[time_frame][1]=="use":
					var n_projectile = projectile.instantiate()
					n_projectile.global_position = position + Vector2(100,0)
					n_projectile.linear_velocity = (get_global_mouse_position() - global_position).normalized()* 800
					get_tree().current_scene.add_child(n_projectile)
				if record_movement[time_frame][1]=="dash":
					velocity.x = 4*velocity.x 
					velocity.y = 0
					isdashing = true
					$dashTimer.start()
			

				
			else:
				velocity.x = 0
		

			
			time_frame += 1
			
			'for c in get_slide_collision_count():
				var col = get_slide_collision(c)
				if col.get_collider().is_in_group("player"):
					velocity.x = velocity.bounce(col.get_normal()).x * bounce_strength'
		
			
			velocity = Vector2(clamp(velocity.x,-max_velocity,max_velocity),clamp(velocity.y,-max_velocity,max_velocity))

			move_and_slide()
		else: #end of loop
			init_past_loop()
	else: #die
		pass
		#init_past_loop()
func Transform_in_rock():
	$Sprite2D.hide()
	$Sprite2D_block.show()
	set_collision_layer_value(1,true)


func Kill():
	alive = false
	modulate = Color(1,1,1,0.2)
	set_collision_layer_value(1,false)
	#set_collision_layer_value(2,false)
	#$Timer.stop()

	
func init_past_loop():
	alive = true
	modulate = Color(1,1,1,0.8)

	time_frame = 0
	$Timer.start(max_time)
	position = starting_position
	set_collision_layer_value(1,false)
	#set_collision_layer_value(2,false)
	await get_tree().create_timer(1.).timeout	
	set_collision_layer_value(1,true)
	#set_collision_layer_value(2,true)


func _on_timer_timeout() -> void:
	init_past_loop()
	pass


func _on_dash_timer_timeout() -> void:
	isdashing = false
