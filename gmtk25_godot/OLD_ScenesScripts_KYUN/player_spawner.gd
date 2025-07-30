extends CharacterBody2D


func _physics_process(delta):
	if Input.is_action_just_pressed("respawn") :
		respawn()
	

func respawn():
	var player_scene = load("res://ScenesScripts/player_cube.tscn")
	var player = player_scene.instantiate()
	add_child(player)
	player.position = Vector2(100,100)
