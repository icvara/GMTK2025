extends Node2D

@export var door: Node2D
@export var flip: bool
@export var color: Color



func _ready() -> void:
	$Sprite2D.flip_h = flip
	$Sprite2D.modulate = color


func Say(text):
	$Panel.show()
	$Panel/Label.text = text

func Silence():
	$Panel.hide()
