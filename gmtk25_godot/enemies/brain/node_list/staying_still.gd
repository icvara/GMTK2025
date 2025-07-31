extends brain_node
class_name staying_still

var target = Node2D

func Enter():
	if get_parent().get_parent():
		brain_owner = 	get_parent().get_parent()
	
func Exit():
	pass
	
func Update(_delta: float):
	pass
	
func Physics_Update(_delta: float):
	pass

func _on_head_area_body_entered(body: Node2D) -> void:
	if get_parent().current_state == self:
		if body.is_in_group("player"):
			target = body
			get_parent().full_brain.get("jumping_toward_player").target = target
			print("something stepped on me")
			Transitioned.emit(self,"jumping_toward_player")
