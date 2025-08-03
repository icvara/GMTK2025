extends CollisionShape2D


func _on_ending_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		get_tree().change_scene_to_file("res://Menus/endscreen.tscn")
		
