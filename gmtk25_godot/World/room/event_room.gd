extends Area2D

var count = 0

@export var computer: Node2D
@export var player: Node2D
@export var rabbit: Node2D

var isfinished = false

func story():
	isfinished = true
	rabbit.show()
	await get_tree().create_timer(1.).timeout
	rabbit.Say("Trying to go out?")
	await get_tree().create_timer(1.).timeout
	rabbit.Say("Why not playing video game instead?")
	await get_tree().create_timer(1.).timeout
	computer.activate()


func open_door():
	pass

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		count += 1
		if count ==7:
			if !isfinished:
				story()
			


func _on_timer_timeout() -> void:
	if !isfinished:
		story()
	
