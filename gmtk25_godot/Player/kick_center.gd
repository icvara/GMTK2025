extends Node2D

var pushed_obj = []

func _physics_process(delta: float) -> void:
	
	var mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)
	rotation += PI 
	
	var direction = Vector2.RIGHT.rotated(rotation)
	'if pushed_obj.size()>0:
		for i in pushed_obj:
				if i.is_in_group("player"):
					i.external_velocity.x -=  1500'
	
	if Input.is_action_just_pressed("kick"):
		direction = Vector2.RIGHT.rotated(rotation)
		#get_parent().velocity += direction * 1500
		pushed_obj = $kick_area.get_overlapping_bodies()
		for i in pushed_obj:
			if i.is_in_group("player"):
				print(i)
				i.external_velocity -= Vector2(direction.x * 700,direction.y * 200)
				print(i.velocity)
