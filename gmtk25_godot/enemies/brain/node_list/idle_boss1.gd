extends brain_node
class_name idle_boss1


@export var walk_time_min = 0.5
@export var walk_time_max = 1.
@export var walk_speed = 200
@export var detection_distance = 800

var wander_time = 0
var direction = Vector2(-1,0)
var target : Node2D

func Enter():
	target = null
	choose_direction_and_time()
	


func choose_direction_and_time():
	direction.x = direction.x *-1

	wander_time = randf_range(walk_time_min,walk_time_max)	
	#if brain_owner:
		#brain_owner.scale = brain_owner.scale * Vector2(-1,1)
		

func Update(delta: float):
	if wander_time > 0:
		wander_time -= delta
	else:
		choose_direction_and_time()
	


func Physics_Update(delta: float):
	if brain_owner.alive:
		brain_owner.velocity.x = direction.x * walk_speed
		
					
				
func _on_detection_area_body_entered(body: Node2D) -> void:
	if get_parent().current_state == self and brain_owner.alive:
			if body.is_in_group("player"):
				if body.alive:
					Transitioned.emit(self,"attack1")
