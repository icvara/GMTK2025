extends brain_node
class_name jumping_toward_player

#@export var walk_time_min = 0.5
#@export var walk_time_max = 1.
@export var walk_speed = 500
#@export var detection_distance = 800
@export var jump_speed = -1500
var target : Node2D
var direction : Vector2
var jumping_now = false

func Enter():
	print("angry now!")
	if get_parent().get_parent():
		brain_owner = 	get_parent().get_parent()
	
func Exit():
	pass
	
func Update(_delta: float):
	pass
	
func Physics_Update(_delta: float):
	if target:
		direction = (target.position - brain_owner.position)
		brain_owner.velocity.x =  walk_speed * sign(direction.x)
	if jumping_now == false:
		jumping_now = true
		brain_owner.velocity.y = jump_speed
		await get_tree().create_timer(1.5).timeout
		jumping_now = false
		
