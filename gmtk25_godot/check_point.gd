extends StaticBody2D

var isActivated =false


func _ready() -> void:
	$AnimatedSprite2D.play()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player" and body.is_in_group("player"):
		if isActivated == false:
			print("entered")
			body.check_point = global_position
			body.starting_position = global_position
			body.restoreLife()
			hide()
			isActivated =true
		if isActivated:
			if body.LP <= 0:
				#body.TRANSITION_SCREEN_IN()
				#body.position = body.room_position
				body.restoreLife()
				#body.TRANSITION_SCREEN_OUT()
				#show()
				isActivated = false
		
