extends CharacterBody2D


@export var moving_speed = 1000
@export var jump_speed = 1500
@export var gravity = 4000
@export var projectile :PackedScene


@export_group("Past_player")
@export var past_1 :PackedScene
@export var time_past = 5.0

#varibale for the record_golem
var record_movement = {}
var time_frame = 0
var starting_position = Vector2(0,0)
var past_player_list = []
var past_record_list = []
var max_record = 5
var last_record_id = 0
var start_recording = false
var LP = 3

signal reset_loop


#movement
var direction = Vector2(0,0)


#monster intraction
var alive = true


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

	position = starting_position
	add_new_record()
	reset_loop.emit()
	#Spawn_ALL_Past_Players()
	Spawn_Past_Player(record_movement,0)
	$Timer.stop()
	$ProgressBar.hide()
	$ProgressBar.value = time_past
	record_movement = {}


func add_new_record():		
	if record_movement.size()>0:
		past_record_list[last_record_id]=record_movement
	
	if last_record_id == max_record-1:
		last_record_id = 0
	else:
		last_record_id += 1
	$Label.text = str(last_record_id)

func _process(delta: float) -> void:
	
	direction = Vector2(0,0)
	
	#left-right
	if Input.is_action_pressed("right"):
		direction.x = 1
	if Input.is_action_pressed("left"):
		direction.x = -1		
	
	velocity.x = moving_speed*direction.x
	#RECORD PART
	if start_recording:
		record_movement[time_frame]=[velocity,"move"]
		time_frame += 1

	#JUMP
	#if is_on_floor()==false:
	velocity.y += gravity *delta
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_speed
		#RECORD PART
		if start_recording:
			record_movement[time_frame]=[velocity,"jump"]
			time_frame += 1

	#if Input.is_action_just_pressed("jump"):
		#print("jumped") 
		#print(is_on_floor())
	#print(velocity)
	#var collision_info = move_and_collide(velocity)
	#if collision_info:
		#velocity = velocity.bounce(collision_info.get_normal())
	
	move_and_slide()

	if Input.is_action_just_pressed("use"):
		var n_projectile = projectile.instantiate()
		n_projectile.global_position = position + Vector2(100,0)
		#n_projectile.direction = (get_global_mouse_position() - global_position).normalized()
		n_projectile.linear_velocity = (get_global_mouse_position() - global_position).normalized()* 800
		get_tree().current_scene.add_child(n_projectile)
		if start_recording:
			record_movement[time_frame]=[velocity,"use"]
			time_frame += 1
	
	if Input.is_action_just_pressed("retry") and !start_recording:
		start_loop()

		
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
	#print(starting_position)
	#position = starting_position
	end_loop()
	LP -= 1
	$UI_LIFE.Update()
	if LP <= 0:
		get_tree().change_scene_to_file("res://Menus/start_menu.tscn")


func _on_timer_timeout() -> void:
	$ProgressBar.value -= 1
	if $ProgressBar.value <= 0:
		$Timer.stop()
		end_loop()
