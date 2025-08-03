extends Control

@export var TP : Node2D
@export var rabbit: Node2D
@export var rabbit_R: Node2D
@export var rabbit_B: Node2D
@export var player: Node2D


@export var bed: Node2D

var story_started = false
var activated = false
var isfinished = false

func _ready() -> void:
	story()

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
	await get_tree().create_timer(1.).timeout
	rabbit.Say("I am finally able to get out!")
	await get_tree().create_timer(2.).timeout
	rabbit.Say("Thanks for your help!")
	await get_tree().create_timer(2.).timeout
	rabbit.Silence()
	await get_tree().create_timer(2.).timeout
	$ColorRect.show()




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
