extends CanvasLayer


func _process(delta: float) -> void:
	$FPS.text = str(Engine.get_frames_per_second() ) 
