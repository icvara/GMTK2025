extends brain_node
class_name going_to

@export var walk_speed = 400
@export var attack_range = 50


var target : Node2D
var direction : Vector2

var past_direction = 1

func Enter():
	if get_parent().get_parent():
		brain_owner = 	get_parent().get_parent()
		if target:
			print("here")
			past_direction = sign((target.position - brain_owner.position).x)

func Exit():
	pass
	
func Update(_delta: float):
	pass
	
func Physics_Update(_delta: float):
	if target:
		direction = (target.position - brain_owner.position)
		brain_owner.velocity.x =  walk_speed * sign(direction.x)
	
		#if past_direction != sign(direction.x):
			#past_direction = sign(direction.x)	
			#brain_owner.scale =  brain_owner.scale * Vector2(-1,1)
			
		if brain_owner.position.distance_to(target.position) < attack_range:
			Transitioned.emit(self,"attack1")

 
	else:
		Transitioned.emit(self,"idle")
