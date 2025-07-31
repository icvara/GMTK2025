extends Control





func _on_button_button_down() -> void:
	get_tree().change_scene_to_file("res://World/Level0/level_0.tscn")


func _on_button_2_button_down() -> void:
	pass # Replace with function body.


func _on_button_3_button_down() -> void:
	get_tree().quit()


func _on_button_4_button_down() -> void:
	get_tree().change_scene_to_file("res://World/Level0/level_1.tscn")


func _on_button_5_button_down() -> void:
	get_tree().change_scene_to_file("res://World/Level0/level_2.tscn")
