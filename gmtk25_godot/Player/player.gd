extends CharacterBody2D


@export var moving_speed = 1000
@export var jump_speed = 750
@export var max_jump_time: float = 0.25  # seconds you can hold jump
var jump_time: float = 0.0
var is_jumping: bool = false
@export var gravity = 4000
@export var projectile :PackedScene
@export_range(0.0,1.0) var friction = 0.1
@export_range(0.0,1.0) var acceleration = 0.25
@export var bounce_strength = 100
@export var max_velocity = 2000

@export_group("Past_player")
@export var past_1 :PackedScene
@export var time_past = 5.0

#varibale for the record_golem
var record_movement = []
var time_frame = 0
var starting_position = Vector2(0,0)
var past_player_list = []
var past_record_list = []
var max_record = 5
var last_record_id = 0
var start_recording = false
var LP = 3
var ACTION := ""
signal reset_loop


#movement
var direction = Vector2(0,0)
var isdashing = false
var is_jumping_started = false
var is_falling = false
var is_pushed = false
var external_velocity =Vector2(0,0)
#monster intraction
var alive = true
var external_friction = 0.05

var count = 0


func _ready() -> void:
	$Camera2D.make_current()
	$Label.text = str(last_record_id)
	$ProgressBar.max_value = time_past
	$ProgressBar.value = time_past

	time_frame = 0
	starting_position = position
	#init record list capped at X
	for r in range(0,max_record):
		past_record_list.append({})


func start_loop():
		#position = starting_position
		$Timer.start(1.0)
		$ProgressBar.show() 
		starting_position = position
		start_recording = true
		#record_movement[time_frame]=[velocity,"rock"]
		#init_loop()

func end_loop():
	start_recording = false
	time_frame = 0
	external_velocity =Vector2(0,0)
	position = starting_position
	add_new_record()
	reset_loop.emit()
	#Spawn_ALL_Past_Players()
	Spawn_Past_Player(record_movement,0)
	$Timer.stop()
	$ProgressBar.hide()
	$ProgressBar.value = time_past
	record_movement = []
	alive =true


func add_new_record():		
	if record_movement.size()>0:
		past_record_list[last_record_id]=record_movement
	
	if last_record_id == max_record-1:
		last_record_id = 0
	else:
		last_record_id += 1
	$Label.text = str(last_record_id)

func _physics_process(delta: float) -> void:
	if alive:

		if isdashing==false:
			direction = Vector2(0,0)

			#left-right
			if Input.is_action_pressed("right"):
				direction.x = 1
				$AnimatedSprite2D.flip_h = true	
			if Input.is_action_pressed("left"):
				direction.x = -1
				$AnimatedSprite2D.flip_h = false
		
			'if is_falling and is_on_floor():
				is_falling =false
				$AnimatedSprite2D.play("jump_landing")
				await get_tree().create_timer(1.).timeout'
			if alive:
				if direction.x == 0  and is_on_floor() and is_jumping_started ==false:
					$AnimatedSprite2D.play("default")
				elif is_on_floor() and is_jumping_started ==false:
					$AnimatedSprite2D.play("walk")
				if is_on_floor() == false:
					$AnimatedSprite2D.play("jump_fall")
			
			#move with more lag
			#velocity.x = moving_speed*direction.x
			if is_jumping_started == false:

				if direction.x != 0:
					velocity.x = lerp(velocity.x,moving_speed*direction.x,acceleration)
				else:
					velocity.x = lerp(velocity.x,0.0,friction)
				#RECORD PART
				if start_recording:
					ACTION ="move"

			#JUMP
			#if is_on_floor()==false:
			


	# Handle jump logic
			if Input.is_action_just_pressed("jump") and is_on_floor():
				is_jumping_started = true
				$AnimatedSprite2D.play("jump_0")
				velocity.x = 0
				if start_recording:
					ACTION ="start_jump"
				await get_tree().create_timer(0.2).timeout
				is_jumping_started = false
				is_jumping = true
				jump_time = 0.0
				velocity.y = -jump_speed

				#velocity.y = -jump_speed

			if Input.is_action_pressed("jump") and is_jumping and is_jumping_started == false :
					if jump_time < max_jump_time:				
						velocity.y = -jump_speed
						jump_time += delta
						if start_recording:
							ACTION ="jump"

					else:
						is_jumping = false
						$AnimatedSprite2D.play("jump_fall")
						is_falling =true

						if start_recording:
							ACTION ="stop_jump"
			if Input.is_action_just_released("jump") and is_jumping:
				is_jumping = false
				$AnimatedSprite2D.play("jump_fall")
				is_falling =true
				if start_recording:
							ACTION ="stop_jump"

						#record_movement.append([velocity, "stop_jump"])

	# Always record once per frame

			#if Input.is_action_pressed("jump") and is_on_floor():
				#if start_recording:
					#record_movement[time_frame]=[velocity,"jump"]
					#time_frame += 1
				#is_jumping = true
				#jump_time = 0.0
				## Continue jump while holding
			#if is_jumping and Input.is_action_pressed("jump") and jump_time < max_jump_time:
				#velocity.y = -jump_speed  # sustain upward force
				#jump_time += delta
				#print(velocity.y )
	#
				##RECORD PART
				#if start_recording:
					#record_movement[time_frame]=[velocity,"jump"]
					#time_frame += 1
			#else :
				#is_jumping = false
			#if Input.is_action_pressed("jump"):
				#if start_recording:
					#record_movement[time_frame]=[velocity,"jump"]
					#time_frame += 1
					
			if Input.is_action_just_pressed("dash"):
				velocity.x = 4*velocity.x 
				velocity.y = 0
				isdashing = true
				$dashTimer.start()
				#RECORD PART
				if start_recording:
					ACTION = "dash"
					
					
			#if Input.is_action_just_pressed("jump"):
				#print("jumped") 
				#print(is_on_floor())
			#print(velocity)
			#var collision_info = move_and_collide(velocity)
			#if collision_info:
				#velocity = velocity.bounce(collision_info.get_normal())
		#var collision_info = move_and_collide(velocity * delta)
		for c in get_slide_collision_count():
			var col = get_slide_collision(c)
			if col.get_collider().is_in_group("player"):
				velocity.x = velocity.bounce(col.get_normal()).x * bounce_strength
		
	velocity.y += gravity *delta
	external_velocity.x = lerp(external_velocity.x,0.0,external_friction)
	external_velocity.y = lerp(external_velocity.y,0.0,external_friction)

	velocity = velocity + external_velocity
	velocity = Vector2(clamp(velocity.x,-max_velocity,max_velocity),clamp(velocity.y,-max_velocity,max_velocity))
	if start_recording:
		record_movement.append([velocity,ACTION])
		time_frame += 1
	move_and_slide()

	if Input.is_action_just_pressed("use"):
		var n_projectile = projectile.instantiate()
		n_projectile.global_position = position + Vector2(100,0)
		#n_projectile.direction = (get_global_mouse_position() - global_position).normalized()
		n_projectile.linear_velocity = (get_global_mouse_position() - global_position).normalized()* 800
		get_tree().current_scene.add_child(n_projectile)
		if start_recording:
			ACTION = "use"
	
	if Input.is_action_just_pressed("retry"):
		if  !start_recording:
			start_loop()
		else:
			end_loop()

		
	'for c in range(0,5):
		if Input.is_action_just_pressed("save"+str(c)):
			past_record_list[c-1]={}'


func Spawn_ALL_Past_Players():
	for p in past_player_list:
		p.queue_free()
	past_player_list = []
	var i = 0
	for record in past_record_list:
		Spawn_Past_Player(record,i)
		i+=1
	


func Spawn_Past_Player(record,i):
	if record.size()>0:
		var new_past_player = past_1.instantiate()
		new_past_player.record_movement = record
		new_past_player.position = self.position
		new_past_player.modulate = Color(1,1,1,0.7)
		new_past_player.past_id = i
		new_past_player.starting_position = starting_position
		new_past_player.max_time =  time_past #- $ProgressBar.value - 1
		new_past_player.projectile = projectile

		print(new_past_player.max_time)
		get_parent().add_child(new_past_player)
		past_player_list.append(new_past_player)
	#currently reinit the save to not have one ghost running trough 5 save 


func Kill():
	if start_recording:
		record_movement.append([velocity,"die"])
		time_frame += 1
	#print(starting_position)
	#position = starting_position
	if alive:
		velocity = Vector2(0,0)
		alive =false
		LP -= 1
		$AnimatedSprite2D.play("dead")
		await get_tree().create_timer(1.5).timeout
		end_loop()
		$UI_LIFE.Update()
		#if LP <= 0:
			#get_tree().change_scene_to_file("res://Menus/start_menu.tscn")


func _on_timer_timeout() -> void:
	$ProgressBar.value -= 1
	if $ProgressBar.value <= 0:
		end_loop()


func _on_dash_timer_timeout() -> void:
	isdashing = false
