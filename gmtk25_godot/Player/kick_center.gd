extends Node2D

var pushed_obj = []
var last_rotation = 0



	#rotation += PI 
	

	
func kick():
		$kick_area/ColorRect.show()
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
		await get_tree().create_timer(0.1).timeout
		$kick_area/ColorRect.hide()
