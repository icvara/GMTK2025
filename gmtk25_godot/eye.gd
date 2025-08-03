extends Node2D


var player



	

func _process(delta: float) -> void:
	if !player:
		player = get_parent().player
	else:
		look_at(player.global_position)
		rotation += PI
	
