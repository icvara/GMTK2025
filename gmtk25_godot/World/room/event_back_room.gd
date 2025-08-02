extends Area2D

var count = 0

@export var player: Node2D
@export var rabbit: Node2D

var start_pos =  Vector2(0,0)

func _ready() -> void:
	start_pos = player.global_position
	



func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player.position = start_pos
		rabbit.story()

		
