extends RigidBody2D
var Blue_ball_scene = preload("res://blue_ball.tscn")

var start_position : Vector2
var timer_started = false
@export var countdown_time = 5.0
var default_countdown_time := 0.0

func _ready() -> void:
	start_position = position
	default_countdown_time = countdown_time  # remember the original export

func _physics_process(delta: float) -> void:
	$Countdown.rotation = 0  # cancel ball’s rotation
	#if self.position != start_position:
		#print("moving")


func Respawn_after_5():
	if timer_started == false :
		timer_started = true
		while countdown_time > 0:
			$Countdown.text = str(ceil(countdown_time))
			await get_tree().process_frame
			countdown_time -= get_process_delta_time()
		#await get_tree().create_timer(5).timeout
		linear_velocity = Vector2.ZERO
		angular_velocity = 0
		constant_force = Vector2(0,0)
		#go_back_to_start()
		var Blue_ball = Blue_ball_scene.instantiate()
		Blue_ball.position = start_position
		Blue_ball.countdown_time = default_countdown_time
		get_parent().add_child(Blue_ball)
		

		print("childMade")
		print(Blue_ball.position)
		timer_started = false
		await get_tree().create_timer(0.1).timeout
		
		queue_free()



func go_back_to_start():
	position = start_position
