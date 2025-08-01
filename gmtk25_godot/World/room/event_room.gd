extends Area2D

var count = 0

@export var door: Node2D
@export var player: Node2D



func story():
	$Sprite2D.show()
	await get_tree().create_timer(1.).timeout
	$Panel.show()
	$Panel/Label.text = "Do you feel stuck?"
	await get_tree().create_timer(1.).timeout
	$Panel/Label.text = "I have daily quest for you!"
	await get_tree().create_timer(1.).timeout
	door.open()


func open_door():
	pass

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		count += 1
		if count ==7:
			story()
			
