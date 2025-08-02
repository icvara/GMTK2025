extends Node2D

@export var door: Node2D

func story():
	show()
	await get_tree().create_timer(1.).timeout
	$Panel.show()
	$Panel/Label.text = "Not bad!"
	await get_tree().create_timer(1.).timeout
	$Panel/Label.text = "Maybe is better to sleep now?"
	await get_tree().create_timer(1.).timeout
	door.show()
	await get_tree().create_timer(1.).timeout
	door.open()
	
