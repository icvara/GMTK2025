extends CanvasLayer

signal b_pressed

func _ready() -> void:
	pass
func _on_button_pressed(button) -> void:
	print(self.name)
