extends Area2D

@export var rabbit: Node2D
@export var TP: Node2D

var story_started = false
var isfinished = false
var loop = true

var player

func story():
	print("repeat")
	story_started = true
	rabbit.Say("It was so fun!")
	await get_tree().create_timer(1.).timeout
	rabbit.Say("let's do it again!")
	await get_tree().create_timer(1.).timeout
	TP.activate()
	isfinished = true

func _process(delta: float) -> void:
	if TP.activated == false and isfinished:
		rabbit.Silence()
		story_started = false
		isfinished = false


func _on_body_entered(body: Node2D) -> void:
	if body.name=="Player" and !story_started:
		story()
