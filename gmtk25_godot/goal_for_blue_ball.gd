extends StaticBody2D




func _on_area_2d_body_entered(body: Node2D) -> void:
	print("yes")
	if body.is_in_group("Ball"):
		print("Ball entered the goal!")
		queue_free()
