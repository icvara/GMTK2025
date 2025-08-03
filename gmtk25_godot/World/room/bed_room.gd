extends Area2D

@export var TP : Node2D
@export var rabbit: Node2D
@export var computer: Node2D

var story_started = false
var activated = false
var isfinished = false
func _ready() -> void:
	desactivate()
	#activate()


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
	await get_tree().create_timer(10).timeout
	rabbit.show()
	await get_tree().create_timer(1.).timeout
	rabbit.Say("No need to go out!")
	await get_tree().create_timer(2.).timeout
	rabbit.Say("We are comfortable here!")
	await get_tree().create_timer(2.).timeout
	rabbit.Say("let's do a nap")
	await get_tree().create_timer(2.).timeout
	activate()
	isfinished = true




func _process(delta: float) -> void:
	if computer.end_battle == true and !story_started and !isfinished:
		story()


func desactivate():
	activated = false
	modulate = Color(0.2,0.2,0.2)

func _on_body_entered(body: Node2D) -> void:
	if activated:
		if body.name == "Player":
			body.TRANSITION_SCREEN_IN()
			#body.room_position = body.position
			body.check_point =  body.position
			body.global_position = TP.global_position
			body.starting_position = TP.global_position

			body.TRANSITION_SCREEN_OUT()
			rabbit.Silence()
			body.power_is_available = true
			body.power_ID = 1
