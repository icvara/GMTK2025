extends RigidBody2D


func _on_body_entered(body: Node) -> void:
	print(body)
	if body.is_in_group("player"):
		body.Kill()
