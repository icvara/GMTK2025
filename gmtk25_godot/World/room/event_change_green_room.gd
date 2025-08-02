extends Node2D

@export var new_TP : Node2D
@export var trick = ""

var isUsed = false

func _ready() -> void:
	$Label.show()
	$Label.text = trick

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and isUsed ==false:
		if new_TP :
			new_TP.isUsed = true
			body.global_position = new_TP.global_position


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		isUsed = false
