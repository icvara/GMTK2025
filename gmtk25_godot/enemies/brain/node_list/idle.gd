extends brain_node
class_name idle

@export var walk_time_min = 0.5
@export var walk_time_max = 1.
@export var walk_speed = 200
@export var detection_distance = 800

var wander_time = 0
var direction = Vector2(-1,0)
var target : Node2D

func Enter():
	if get_parent().get_parent():
		brain_owner = 	get_parent().get_parent()
	choose_direction_and_time()
	


func choose_direction_and_time():
	direction.x = direction.x *-1

	wander_time = randf_range(walk_time_min,walk_time_max)	
	if brain_owner:
		brain_owner.scale = brain_owner.scale * Vector2(-1,1)
		

func Update(delta: float):
	if wander_time > 0:
		wander_time -= delta
	else:
		choose_direction_and_time()
	


func Physics_Update(delta: float):
	brain_owner.velocity.x = direction.x * walk_speed
	if target:
		if brain_owner.position.distance_to(target.position) < detection_distance:
				Transitioned.emit(self,"going_to")
				get_parent().full_brain.get("going_to").target = target
				
		
			

func _on_detection_area_body_entered(body: Node2D) -> void:
	print(body)
	if body.is_in_group("player"):
		print("here")
		target = body
