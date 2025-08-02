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
				if i.is_in_group("player"):
					if get_parent().name == "Player":
						i.queue_free()
				else:
				# If it's a RigidBody2D, kick it
					if i is RigidBody2D:
						i.apply_impulse(direction* Vector2(-200, -500))
					else:
						i.external_velocity -= Vector2(direction.x * 700,direction.y * 200)
		await get_tree().create_timer(0.1).timeout
		$kick_area/ColorRect.hide()
