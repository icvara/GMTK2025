extends Node2D


@export var player : Node2D


var camera
var camera_lock = false




func _process(delta: float) -> void:
	if camera_lock:
		pass
		#camera.global_position = global_position


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":

		camera = body.get_node("Camera2D")
		camera_lock = true
		#camera.current = false
		$Camera2D.make_current()
		#camera.global_position = global_position


func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		camera = body.get_node("Camera2D")
		camera.make_current()
