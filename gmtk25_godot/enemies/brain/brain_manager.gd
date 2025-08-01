extends Node

var current_state: brain_node
var full_brain : Dictionary = {}

var initialised: bool = false

@export var initial_state : brain_node 

func _ready():
	if not initialised:
		for child in get_children():
			if child is brain_node:
				full_brain[child.name.to_lower()] = child
				child.Transitioned.connect(on_child_transition)
				child.brain_owner = get_parent()
		initialised = true
		
	if initial_state:
		initial_state.Enter()
		current_state = initial_state

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if current_state:
		current_state.Update(delta)


func _physics_process(delta):
	if current_state:
		current_state.Physics_Update(delta)


func on_child_transition(state, new_state_name):
	if state != current_state:
		return
	
	var new_brain_node = full_brain.get(new_state_name.to_lower())
	if !new_brain_node:
		return		
	if current_state:
		current_state.Exit()
	new_brain_node.Enter()
	current_state = new_brain_node
