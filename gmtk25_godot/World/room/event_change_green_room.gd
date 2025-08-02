extends Node2D

@export var new_TP : Node2D
@export var trick = ""

func _ready() -> void:
	$Label.show()
	$Label.text = trick

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.position = new_TP.position
