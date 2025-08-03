extends Area2D

@export var TP : Node2D
@export var rabbit_G: Node2D
@export var rabbit_R: Node2D
@export var rabbit_B: Node2D
@export var player: Node2D


@export var bed: Node2D

var story_started = false
var activated = false
var isfinished = false
func _ready() -> void:
	desactivate()
	#story()

func activate():
	modulate = Color(1,1,1)
	await get_tree().create_timer(0.1).timeout
	modulate = Color(0.2,0.2,0.2)
	await get_tree().create_timer(0.1).timeout
	modulate = Color(1,1,1)
	await get_tree().create_timer(0.1).timeout
	modulate = Color(0.2,0.2,0.2)
	await get_tree().create_timer(0.1).timeout
	modulate = Color(1,1,1)
	activated = true

func story():
	story_started = true
	player.get_node("AnimatedSprite2D").play("default")
	player.set_physics_process(false)
	#await get_tree().create_timer(5).timeout
	rabbit_G.Say("You can get out...")
	await get_tree().create_timer(2.).timeout
	rabbit_G.Say("It's really what you want?")
	await get_tree().create_timer(2.).timeout
	rabbit_G.Say("You will never be able to get rid of us")
	await get_tree().create_timer(2.).timeout
	rabbit_G.Silence()
	player.Say("I know you're my worst enemies")
	await get_tree().create_timer(2.).timeout
	player.Say("but also my best friends")
	await get_tree().create_timer(2.).timeout
	player.Silence()
	player.set_physics_process(true)
	isfinished = true



func _process(delta: float) -> void:
	pass
	'if bed.end_battle == true and !story_started and !isfinished:
		story()'


func desactivate():
	activated = false
	modulate = Color(0.2,0.2,0.2)

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		if !isfinished and !story_started:
			story()
	'if activated:
		if body.name == "Player":
			body.TRANSITION_SCREEN_IN()
			get_tree().change_scene_to_file("res://Menus/endscreen.tscn")
			body.room_position = body.position
			body.global_position = TP.global_position
			body.TRANSITION_SCREEN_OUT()
			rabbit.Silence()'
