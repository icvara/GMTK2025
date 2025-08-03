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
		$AnimatedSprite2D.stop()
		$AnimatedSprite2D.modulate(0,0,0)
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
		$AnimatedSprite2D.play("default")
		$AnimatedSprite2D.modulate=  Color(1,1,1)
		$AnimatedSprite2D2.play("default")
		$AnimatedSprite2D2.modulate=  Color(1,1,1)
		$AnimatedSprite2D3.play("default")
		$AnimatedSprite2D3.modulate=  Color(1,1,1)
	if player.LP == 2:
		$ColorRect.color = Color(1,0,0)
		$ColorRect2.color = Color(1,0,0)
		$ColorRect3.color = Color(0,0,0)
		$AnimatedSprite2D.play("default")
		$AnimatedSprite2D.modulate =  Color(1,1,1)
		$AnimatedSprite2D2.play("default")
		$AnimatedSprite2D2.modulate=  Color(1,1,1)
		$AnimatedSprite2D3.stop()
		$AnimatedSprite2D3.modulate=  Color(0.2,0.2,0.2)
	if player.LP == 1:
		$ColorRect.color = Color(1,0,0)
		$ColorRect2.color = Color(0,0,0)
		$ColorRect3.color = Color(0,0,0)
		$AnimatedSprite2D.play("default")
		$AnimatedSprite2D.modulate=  Color(1,1,1)
		$AnimatedSprite2D2.stop()
		$AnimatedSprite2D2.modulate=  Color (0.2,0.2,0.2)
		$AnimatedSprite2D3.stop()
		$AnimatedSprite2D3.modulate=  Color(0.2,0.2,0.2)

	if player.LP == 0:
		$ColorRect.color = Color(0,0,0)
		$ColorRect2.color = Color(0,0,0)
		$ColorRect3.color = Color(0,0,0)
		
		$AnimatedSprite2D.stop()
		$AnimatedSprite2D.modulate=  Color(0.2,0.2,0.2)
		$AnimatedSprite2D2.stop()
		$AnimatedSprite2D2.modulate=  Color(0.2,0.2,0.2)
		$AnimatedSprite2D3.stop()
		$AnimatedSprite2D3.modulate=  Color(0.2,0.2,0.2)
