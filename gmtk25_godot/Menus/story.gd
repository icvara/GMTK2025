extends Control
var isdone = false

func _ready() -> void:
	
	$Timer.start()
	

func _on_timer_timeout() -> void:
	$Label2.show()
	isdone = true
	

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("jump") and isdone:
		get_tree().change_scene_to_file("res://World/Level0/level_0.tscn")

	
	
