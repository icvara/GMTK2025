extends StaticBody2D


var player
var isclose = false

func _ready() -> void:
	open()

func open():
	$TileMapLayer.hide()
	set_collision_layer_value(1,false)
	isclose = false

func close():	
	$TileMapLayer.show()
	set_collision_layer_value(1,true)
	isclose = true

func _process(delta: float) -> void:
	if isclose:
		if player:
			if player.LP <= 0:
				open()
	

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		close()
		player = body
