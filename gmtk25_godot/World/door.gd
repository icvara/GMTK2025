extends StaticBody2D


func open():
	$TileMapLayer.hide()
	set_collision_layer_value(1,false)

func close():	
	$TileMapLayer.show()
	set_collision_layer_value(1,true)
