extends CanvasLayer



func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Esc"):


		if visible:
			hide()
			get_tree().paused = false
		else:
			show()
			get_tree().paused = true			
	
	
func _on_button_pressed() -> void:
	hide()
	get_tree().paused = false


func _on_button_3_pressed() -> void:
	if DisplayServer.window_get_mode() == 3:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED) 
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)

func _on_button_2_pressed() -> void:
	get_tree().quit()
