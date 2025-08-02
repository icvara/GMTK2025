extends Node2D

var pushed_obj = []
var last_rotation = 0



	#rotation += PI 
	

	


func kick_ball():
		$kick_area/ColorRect.show()
		$kick_area/ColorRect.color = Color(0, 0, 1)      # blue
		var direction = Vector2.RIGHT.rotated(rotation)
		#get_parent().velocity += direction * 1500
		pushed_obj = $kick_area.get_overlapping_bodies() 
		for i in pushed_obj:
			if i != get_parent():
				if i.is_in_group("Ball"):
					i.apply_impulse(direction* Vector2(-500, -500))
					i.Respawn_after_5()
		await get_tree().create_timer(0.1).timeout
		$kick_area/ColorRect.hide()
		$kick_area/ColorRect.color = Color(1, 1, 1)      # white
