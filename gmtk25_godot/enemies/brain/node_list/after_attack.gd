extends brain_node
class_name after_attack

@export var damage_area : Node2D
@export var duration = 1.5
@export var next_state : brain_node
@export var animation : AnimatedSprite2D

var isInvuFrame = false

func Enter():


	damage_area.show()
		#attack_area.get_node("CollisionShape2D").disabled = false
	damage_area.monitoring = true
	animation.play("recovery")
	await get_tree().create_timer(duration).timeout
	damage_area.hide()
		#attack_area.get_node("CollisionShape2D").disabled = true
	damage_area.monitoring = false

	Transitioned.emit(self,next_state.name)

	
func Exit():
	damage_area.hide()
	damage_area.monitoring = false

func Update(delta: float):
	pass


func Physics_Update(delta: float):
	pass

					
