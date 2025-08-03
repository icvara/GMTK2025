extends Area2D

@export var bunny : Node2D


var count = 0



func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player" and count == 0:
		body.color = bunny.color*0.5
		body.get_node("AnimatedSprite2D").modulate = body.color
		count += 1


func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player" and count<2:
		body.color += bunny.color*0.5
		body.get_node("AnimatedSprite2D").modulate = body.color
		bunny.hide()
		count += 1


		#queue_free()
