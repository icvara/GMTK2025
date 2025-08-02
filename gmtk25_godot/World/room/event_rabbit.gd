extends Node2D

@export var door: Node2D
@export var flip: bool
@export var color: Color



func _ready() -> void:
	$Sprite2D.flip_h = flip
	$Sprite2D.modulate = color

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
	

func Say(text):
	$Panel.show()
	$Panel/Label.text = text

func Silence():
	$Panel.hide()
