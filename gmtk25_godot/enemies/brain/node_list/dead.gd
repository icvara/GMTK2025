extends brain_node
class_name dead
@export var animation : AnimatedSprite2D

#@export var damage_area : Node2D


var isInvuFrame = false

func Enter():
	#brain_owner.modulate = Color(0,0,0,0.2)
	brain_owner.velocity = Vector2(0,0)
	animation.play("dead")
func Exit():

	pass

func Update(delta: float):
	pass


func Physics_Update(delta: float):
	pass

					
