extends Area2D





func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("something enetred")
	
		$VBoxContainer.show
		#body.freeze = true  # Example: stop the player
		get_tree().paused = true
		$VBoxContainer.visible = true
	


func _on_button_button_down() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://World/Level0/level_1.tscn")
	
