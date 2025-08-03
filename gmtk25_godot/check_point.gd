extends StaticBody2D





func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == ("Player") and is_in_group("player"):
		body.starting_position = position
