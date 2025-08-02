extends CharacterBody2D


@export var moving_speed = 000
@export var jump_speed = 1500
@export var gravity = 4000
@export var HP = 100
@export var maxHP = 100
@export var door : Node2D
@onready var attack_area: Area2D = $Light_attack/Area2D   # your Area2D node
@export var min_y: float = 0
@export var max_y: float = 680
var animation_frame = 0
@export var interval: float = 3.0   # seconds between activations
#@export var door2 : Node2D

#@export var player: Node2D
var alive = true
var starting_position = Vector2(0,0)

func _ready() -> void:
	$ProgressBar.max_value = maxHP
	$ProgressBar.value = HP
	randomize()
	_start_attack_cycle()
	
	starting_position = position
	var player = get_parent().get_node("Player")
	#player.reset_loop.connect(on_reset_loop)

func _start_attack_cycle():
	if alive == true :
		spawn_attack()
		# Schedule the next activation
		var wait_time = interval + randf_range(0, 0)  # small random variation
		await get_tree().create_timer(wait_time).timeout
		_start_attack_cycle()
	
func spawn_attack():
	# Pick a random Y offset
	var new_y = randf_range(min_y, max_y)
	attack_area.position = Vector2(0,new_y)
	
	# Show and enable the area
	attack_area.visible = true
	attack_area.monitoring = true
	$Light_attack/Area2D/AnimatedSprite2D.frame = 0
	$Light_attack/Area2D/AnimatedSprite2D.play()
	
	print("Area spawned at Y:", attack_area.position)
	
	# Hide again after 1 second
	await get_tree().create_timer(2.0).timeout
	attack_area.visible = false
	attack_area.monitoring = false

func _process(delta: float) -> void:	
	velocity.y += gravity *delta
	#if $Light_attack/Area2D/AnimatedSprite2D.play() == 1:
	animation_frame = $Light_attack/Area2D/AnimatedSprite2D.frame
	for body in $Light_attack/Area2D.get_overlapping_bodies():
		if animation_frame == 3 and body.is_in_group("player"):
			print("I touched a player")
			body.Kill()


func Kill():
	alive = false
	velocity = Vector2(0,0)
	if door:
		door.open()
	#modulate = Color(0,0,0,0.2)


func getDamage(value):
	HP -= value
	$ProgressBar.value = HP
	if HP <= 0:
		Kill()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Ball"):
		getDamage(1)
		print(HP)


func _on_area_2d_body_entered2(body: Node2D) -> void:
	print("Itouched"+str(body))
	if animation_frame == 3 and body.is_in_group("player"):
		print("I touched a player")
		body.Kill()
