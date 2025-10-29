class_name Player extends CharacterBody2D


var cardinal_direction : Vector2 = Vector2.DOWN
var direction: Vector2 = Vector2.ZERO

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var state_machine: PlayerStateMachine = $StateMachine

func _ready():
	state_machine.initialize(self)
	pass

func _process(_delta):
	direction = Vector2(
		Input.get_axis("ui_left","ui_right"),
		Input.get_axis("ui_up", "ui_down")
	).normalized()
	pass
	

func _physics_process(_delta: float) -> void:
	move_and_slide()

func setDirection() -> bool:
	var new_direction: Vector2 = cardinal_direction
	if direction == Vector2.ZERO:
		return false
		
	if direction.y == 0:
		new_direction = Vector2.LEFT if direction.x < 0 else Vector2.RIGHT
	elif direction.x == 0:
		new_direction = Vector2.UP if direction.y < 0 else Vector2.DOWN
		
	if new_direction == cardinal_direction:
		return false
	else:
		cardinal_direction = new_direction
		return true
	


func animationDirection() -> String:
	if cardinal_direction == Vector2.DOWN:
		return "front"
	elif cardinal_direction == Vector2.UP:
		return "back"
	elif cardinal_direction == Vector2.LEFT:
		return "left"
	else:
		return "right"
	
	
func updateAnimation(state: String):
	animated_sprite_2d.animation = state + "_" + animationDirection()
	pass
	
	
	
