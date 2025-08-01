extends CharacterBody2D


@export var moving_speed = 1000
@export var jump_speed = 1500
@export var gravity = 4000
@export var HP = 10
@export var maxHP = 10

#@export var player: Node2D
var alive = true
var starting_position = Vector2(0,0)

func _ready() -> void:
	$ProgressBar.max_value = maxHP
	$ProgressBar.value = HP
	
	starting_position = position
	var player = get_parent().get_node("Player")
	player.reset_loop.connect(on_reset_loop)

	

func _process(delta: float) -> void:	
	velocity.y += gravity *delta
	move_and_slide()
	

func on_reset_loop():
	alive = true
	modulate = Color(1,1,1,1)
	position = starting_position
	$Brain.on_child_transition($Brain.current_state, $Brain.initial_state.name)


func Kill():
	alive = false
	velocity = Vector2(0,0)
	$Brain.on_child_transition($Brain.current_state, $Brain.initial_state.name)
	modulate = Color(1,1,1,0.2)


func getDamage(value):
	HP -= value 
	$ProgressBar.value = HP
	if HP <= 0:
		Kill()
