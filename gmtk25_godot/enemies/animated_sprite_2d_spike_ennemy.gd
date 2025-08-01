extends AnimatedSprite2D

var pingpong_forward := true
var timer := 0.0
var frame_time := 0.04 # smaller = faster
var attacking := false

func _ready():
	stop()  # prevent auto animation
	set_process(false)

func _process(delta: float) -> void:
	if attacking:
		Spike_attack(delta)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and not attacking:
		attacking = true
		pingpong_forward = true
		timer = 0.0
		frame = 0
		set_process(true)  # start calling _process
		body.Kill()

func Spike_attack(delta: float) -> void:
	timer += delta
	var current_frame_time = frame_time
	# If we're on the last frame while moving forward → hold longer
	if pingpong_forward and frame == sprite_frames.get_frame_count(animation) -1:
		current_frame_time = frame_time * 30  # lasts 3x longer (tweak this)
	
	if timer >= current_frame_time:
		timer = 0.0
		if pingpong_forward:
			frame += 1
			if frame < sprite_frames.get_frame_count(animation) -1:
				frame += 1
			else:
			# reached last frame → flip direction next update
				pingpong_forward = false
				frame -= 1
		else:
			frame -= 1
			if frame <= 0:
				attacking = false
				set_process(false)  # stop calling _process
