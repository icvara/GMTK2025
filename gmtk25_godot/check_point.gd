extends StaticBody2D





func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player" and body.is_in_group("player"):
		print("entered")
		body.room_position = position
		body.starting_position = position
		body.restoreLife()
