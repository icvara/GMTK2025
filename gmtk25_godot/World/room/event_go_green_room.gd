extends Node2D
@export var TP :  Node2D


func go_to_top_view(p):
	p.gravity = 0
	p.topview = true
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.TRANSITION_SCREEN_IN()
		body.global_position = TP.global_position
		go_to_top_view(body)
		body.power_is_available = true
		body.power_ID =2 
		body.TRANSITION_SCREEN_OUT()
 
