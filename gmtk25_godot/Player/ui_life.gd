extends CanvasLayer


@export var player: Node2D


func _ready() -> void:
	if player.LP == 3:
		$ColorRect.color = Color(1,0,0)
		$ColorRect2.color = Color(1,0,0)
		$ColorRect3.color = Color(1,0,0)
	if player.LP == 2:
		$ColorRect.color = Color(1,0,0)
		$ColorRect2.color = Color(1,0,0)
		$ColorRect3.color = Color(0,0,0)
	if player.LP == 1:
		$ColorRect.color = Color(1,0,0)
		$ColorRect2.color = Color(0,0,0)
		$ColorRect3.color = Color(0,0,0)
	if player.LP == 0:
		$ColorRect.color = Color(0,0,0)
		$ColorRect2.color = Color(0,0,0)
		$ColorRect3.color = Color(0,0,0)


func Update():
	if player.LP == 3:
		$ColorRect.color = Color(1,0,0)
		$ColorRect2.color = Color(1,0,0)
		$ColorRect3.color = Color(1,0,0)
	if player.LP == 2:
		$ColorRect.color = Color(1,0,0)
		$ColorRect2.color = Color(1,0,0)
		$ColorRect3.color = Color(0,0,0)
	if player.LP == 1:
		$ColorRect.color = Color(1,0,0)
		$ColorRect2.color = Color(0,0,0)
		$ColorRect3.color = Color(0,0,0)
	if player.LP == 0:
		$ColorRect.color = Color(0,0,0)
		$ColorRect2.color = Color(0,0,0)
		$ColorRect3.color = Color(0,0,0)
