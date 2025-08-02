extends StaticBody2D




func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Blue_ball":   # or body.is_in_group("ball")
		print("Ball entered the goal!")
