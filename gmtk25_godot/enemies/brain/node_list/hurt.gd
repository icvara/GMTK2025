extends brain_node
class_name hurt

#@export var damage_area : Node2D
@export var invu_frame_duration = 0.5
@export var next_state : brain_node

var isInvuFrame = false

func Enter():
	print("hurt state")
	isInvuFrame = true
	brain_owner.modulate = Color(1,0,0)
	brain_owner.velocity = Vector2(0,0)
	brain_owner.getDamage(1)
	await get_tree().create_timer(invu_frame_duration).timeout
	isInvuFrame = false
	Transitioned.emit(self, next_state.name)


	
func Exit():
	brain_owner.modulate = Color(1,1,1)

	pass

func Update(delta: float):
	pass


func Physics_Update(delta: float):
	pass

					


func _on_damage_area_body_entered(body: Node2D) -> void:
	if !isInvuFrame and brain_owner.alive:
		if body.is_in_group("player"):
			Transitioned.emit(get_parent().current_state, "hurt")
	
