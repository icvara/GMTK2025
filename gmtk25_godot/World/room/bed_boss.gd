extends Area2D


@export var BOSS: PackedScene
@export var bed_room :Node2D

var player : Node2D
var boss :Node2D

var isfinshed = false
var end_battle = false


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	
	if boss and end_battle==false:
		if !boss.alive:
			end_fight_event()
			end_battle = true

func end_fight_event():
	for member in get_tree().get_nodes_in_group("Ball"):
		member.queue_free()
	await get_tree().create_timer(5.).timeout
	bed_room.desactivate()
	for member in get_tree().get_nodes_in_group("Ball"):
		member.queue_free()
	player.TRANSITION_SCREEN_IN()
	player.global_position = player.room_position
	player.starting_position = player.room_position
	#player.power_is_available = false
	player.TRANSITION_SCREEN_OUT()


func spawn_boss():
	player.external_velocity.x = -500
	'$AnimatedSprite2D.show()
	await get_tree().create_timer(0.1).timeout
	$AnimatedSprite2D.hide()
	await get_tree().create_timer(0.1).timeout
	$AnimatedSprite2D.show()
	await get_tree().create_timer(0.1).timeout
	$AnimatedSprite2D.hide()
	await get_tree().create_timer(0.1).timeout
	$AnimatedSprite2D.show()
	await get_tree().create_timer(0.1).timeout
	$AnimatedSprite2D.hide()
	await get_tree().create_timer(0.1).timeout'
	$TileMapLayer.hide()
	boss = BOSS.instantiate()
	boss.position = position - Vector2(-64,664)
	get_parent().add_child(boss)
	isfinshed =  true

func _on_body_entered(body: Node2D) -> void:
	if !isfinshed:
		if body.name == "Player":
			body.velocity = Vector2(0,0)
			player = body
			$Control.show()
			get_tree().paused = true


func _on_button_Y_pressed() -> void:
	$Control.hide()
	get_tree().paused = false
	spawn_boss()


func _on_button_N_pressed() -> void:
	$Control.hide()
	get_tree().paused = false
