extends Node2D
var BallScene = preload("res://blue_ball.gd")

func _ready():
	var ball = BallScene.instantiate()
	add_child(ball)
	ball.position = Vector2(200, 100)
