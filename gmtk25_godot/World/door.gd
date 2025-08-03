extends StaticBody2D


func _ready() -> void:
	open()

func open():
	$TileMapLayer.hide()
	set_collision_layer_value(1,false)

func close():	
	$TileMapLayer.show()
	set_collision_layer_value(1,true)


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		close()
