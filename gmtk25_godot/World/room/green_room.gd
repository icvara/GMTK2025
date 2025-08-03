extends Area2D

@export var TP : Node2D
@export var rabbit_G: Node2D
@export var rabbit_R: Node2D
@export var rabbit_B: Node2D

@export var bed: Node2D

var story_started = false
var activated = false
var isfinished = false
func _ready() -> void:
	desactivate()
	#story()
	activate()
	

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
	await get_tree().create_timer(5).timeout
	rabbit_R.Say("Are we playing again?")
	await get_tree().create_timer(2.).timeout
	rabbit_R.Silence()
	rabbit_B.Say("Maybe going back to sleep?")
	await get_tree().create_timer(2.).timeout
	rabbit_B.Say("Outside world sucks anyway!")
	await get_tree().create_timer(2.).timeout
	rabbit_B.Silence()
	rabbit_G.show()
	await get_tree().create_timer(2.).timeout
	rabbit_G.Say("There is a lot of sadness outside")
	await get_tree().create_timer(2.).timeout
	rabbit_G.Say("Everything that live, die")
	await get_tree().create_timer(2.).timeout
	activate()

	isfinished = true



func _process(delta: float) -> void:
	if bed.end_battle == true and !story_started and !isfinished:
		story()


func desactivate():
	activated = false
	modulate = Color(0.2,0.2,0.2)

func _on_body_entered(body: Node2D) -> void:
	if activated:
		if body.name == "Player":
			queue_free()
			#body.TRANSITION_SCREEN_IN()
			#get_tree().change_scene_to_file("res://Menus/endscreen.tscn")
			'body.room_position = body.position
			body.global_position = TP.global_position
			body.TRANSITION_SCREEN_OUT()
			rabbit.Silence()'
