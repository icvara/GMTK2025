extends Area2D

@export var rabbit_R: Node2D

@export var bed: Node2D

var story_started = false
var activated = false
var isfinished = false




func story():
	story_started = true
	rabbit_R.Say("I can help us!")
	await get_tree().create_timer(1.).timeout
	#rabbit_R.Silence()
	$Label.show()
	await get_tree().create_timer(1.).timeout

	$Label2.show()
	isfinished = true





func desactivate():
	activated = false
	modulate = Color(0.2,0.2,0.2)

func _on_body_entered(body: Node2D) -> void:
		if body.name == "Player":
			story()
