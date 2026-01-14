extends CharacterBody2D

enum State {
	IDLE,
	WALK,
	ATTACK,
	DEAD
}

@export_category("Stats")
@export var speed: int = 200

var state: State = State.IDLE
var move_direction: Vector2 = Vector2(0,0)

@onready var animation_tree: AnimationTree = $AnimationTree
@onready var animation_playback: AnimationNodeStateMachinePlayback = $AnimationTree["parameters/playback"]

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	
	if state == State.IDLE or State.WALK:
		if input_direction.x < 0:
			$Sprite2D.flip_h = true
		elif input_direction.x > 0:
			$Sprite2D.flip_h = false
	
	if velocity != Vector2.ZERO and state == State.IDLE:
		state = State.WALK
		update_animation()
	elif velocity == Vector2.ZERO and state == State.WALK:
		state = State.IDLE
		update_animation()


func _physics_process(delta):
	get_input()
	move_and_slide()
		
func update_animation() -> void:
		match state:
			State.IDLE:
				animation_playback.travel("idle")
			State.WALK:
				animation_playback.travel("walk")
				
