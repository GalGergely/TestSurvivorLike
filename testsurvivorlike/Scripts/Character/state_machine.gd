class_name PlayerStateMachine extends Node


var states: Array[State]
var previous_state: State
var current_state: State

func _ready() -> void:
	PROCESS_MODE_DISABLED
	pass

func _process(delta: float) -> void:
	changeState(current_state.process(delta))
	pass
	
func _physics_process(delta: float) -> void:
	changeState(current_state.physics(delta))
	pass
	
func _unhandled_input(event: InputEvent) -> void:
	changeState(current_state.handleInput(event))
	pass

func initialize(_player: Player) -> void:
	states = []
	
	for c in get_children():
		if c is State:
			states.append(c)
			
		if states.size() > 0:
			states[0].player = _player
			changeState(states[0])
			PROCESS_MODE_INHERIT

func changeState(new_state : State) -> void:
	if new_state == null || new_state == current_state:
		return
		
	if current_state:
		current_state.exit()
	
	previous_state = current_state
	current_state = new_state
	current_state.enter()
