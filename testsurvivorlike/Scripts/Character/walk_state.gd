class_name StateWalk extends State

@export var move_speed: float = 300.0
@onready var idle: State = $"../Idle"

func enter() -> void:
	player.updateAnimation("walk")
	pass

func exit() -> void:
	pass

func process(_delta: float) -> State:
	if player.direction == Vector2.ZERO:
		return idle
	
	player.velocity = player.direction * move_speed
	
	if player.setDirection():
		player.updateAnimation("walk")
	return null

func physics(_delta: float) -> State:
	return null
	
func handleInput(_event: InputEvent) -> State:
	return null
