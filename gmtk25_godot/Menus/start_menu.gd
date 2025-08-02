extends Control





func _on_button_button_down() -> void:
	$Clickbutton.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Menus/story.tscn")


func _on_button_2_button_down() -> void:
	$Clickbutton.play()




func _on_button_4_button_down() -> void:
	$Clickbutton.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://World/Level0/level_1.tscn")


func _on_button_5_button_down() -> void:
	$Clickbutton.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://World/Level0/level_2.tscn")


func _on_button_3_pressed() -> void:
	$Clickbutton.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().quit()
