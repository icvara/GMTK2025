extends Area2D


@export var TP : Node2D
@export var rabbit: Node2D

var activated = false

func _ready() -> void:
	desactivate()

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


func desactivate():
	activated = false
	modulate = Color(0.2,0.2,0.2)

func _on_body_entered(body: Node2D) -> void:
	if activated:
		if body.name == "Player":
			body.TRANSITION_SCREEN_IN()
			body.room_position = body.position
			body.global_position = TP.global_position
			body.TRANSITION_SCREEN_OUT()
			rabbit.Silence()
			body.power_is_available = true
			body.power_ID = 0
