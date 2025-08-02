extends Area2D

@export var rabbit: Node2D
@export var TP: Node2D


var isfinished = false

func story():
	isfinished = true
	rabbit.Say("It was so fun!")
	await get_tree().create_timer(1.).timeout
	rabbit.Say("let's do it again!")
	await get_tree().create_timer(1.).timeout
	TP.activate()




func _on_body_entered(body: Node2D) -> void:
	if body.name=="Player" and !isfinished:
		story()
