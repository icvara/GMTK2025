extends brain_node
class_name attack1


@export var next_state : brain_node
@export var attack_area : Node2D

@export var walk_speed = 400
@export var duration = 0.2

var target : Node2D
var direction : Vector2

var past_direction = 1

func Enter():
	if get_parent().get_parent():
		brain_owner = 	get_parent().get_parent()
		brain_owner.velocity = Vector2(0,0)
		attack_area.show()
		#attack_area.get_node("CollisionShape2D").disabled = false
		await get_tree().create_timer(duration).timeout
		attack_area.hide()
		#attack_area.get_node("CollisionShape2D").disabled = true
		Transitioned.emit(self,next_state.name)



func Exit():
	pass
	
func Update(_delta: float):
	pass
	
func Physics_Update(_delta: float):
	pass


func _on_attack_area_body_entered(body: Node2D) -> void:

	#if get_parent().current_state == self:
		#print("here")

		if body.is_in_group("player"):
			if body.name =="Player":
				body.end_loop()
			else:
				body.Kill()
