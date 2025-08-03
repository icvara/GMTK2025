extends Node2D

var pushed_obj = []
var last_rotation = 0



	#rotation += PI 
	

	
func kick():
		$kick_area/AnimatedSprite2D.show()
		$kick_area/AnimatedSprite2D.play("default")
		#get_parent().set_physics_process(false)
		#await get_tree().create_timer(1.0).timeout
		
		#$kick_area/ColorRect.show()
		var direction = Vector2.RIGHT.rotated(rotation)
		#get_parent().velocity += direction * 1500
		pushed_obj = $kick_area.get_overlapping_bodies() 
		for i in pushed_obj:
			if i != get_parent():
				if i.is_in_group("player") and name !="Player":
					if get_parent().name == "Player":
						i.queue_free()
					else:
						if i.is_in_group("Ball") == false:
							i.external_velocity -= Vector2(direction.x * 700,direction.y * 200)
						else :
							pass
		await get_tree().create_timer(.1).timeout
		#get_parent().set_physics_process(true)

		#$kick_area/ColorRect.hide()
		#$kick_area/AnimatedSprite2D.show()
		$kick_area/AnimatedSprite2D.hide()
