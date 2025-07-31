extends brain_node
class_name going_to

@export var walk_speed = 400

var target : Node2D
var direction : Vector2


func Enter():
	if get_parent().get_parent():
		brain_owner = 	get_parent().get_parent()
	
func Exit():
	pass
	
func Update(_delta: float):
	pass
	
func Physics_Update(_delta: float):
	if target:
		direction = (target.position - brain_owner.position).normalized()
		brain_owner.velocity.x = direction.x * walk_speed
		#brain_owner.scale.x = direction.x *1.5

	else:
		Transitioned.emit(self,"idle")
