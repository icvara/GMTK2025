extends Node2D

@export var new_TP : Node2D
@export var trick = ""

var isUsed = false
@export var activated : bool = true
@export var single_use : bool = false
@export var set_starting_pos : bool = false



func _ready() -> void:
	if activated:
		show()
		$Area2D.set_collision_mask_value(2,true)
	else:
		hide()
		$Area2D.set_collision_mask_value(2,false)

	$Label.show()
	$Label.text = trick

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and isUsed ==false:
		if new_TP :
			new_TP.isUsed = true
			if body.name == "Player":
				body.TRANSITION_SCREEN_IN()
				
			body.global_position = new_TP.global_position
			if set_starting_pos:
					body.check_point = new_TP.global_position
					body.starting_position = new_TP.global_position
			if body.name == "Player":
				body.TRANSITION_SCREEN_OUT()
			if single_use:
				desactivate()

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		isUsed = false


func activate():
	show()
	activated = true
	$Area2D.set_collision_mask_value(2,true)


func desactivate():
	activated = false	
	
	hide()
	$Area2D.set_collision_mask_value(2,false)
