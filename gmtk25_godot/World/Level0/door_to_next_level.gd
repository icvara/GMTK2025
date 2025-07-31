extends Area2D





func _on_body_entered(body: Node2D) -> void:
	print("something enetred")
	
	$VBoxContainer.show
	#body.freeze = true  # Example: stop the player
	get_tree().paused = true
	$VBoxContainer.visible = true
	


func _on_button_button_down() -> void:
	print("You pressed the button")
