extends StaticBody2D


func open():
	$Sprite2D.hide()
	set_collision_layer_value(1,false)

func close():	
	$Sprite2D.show()
	set_collision_layer_value(1,true)
