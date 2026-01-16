extends CharacterBody2D



var player_in_area = false

var is_chatting = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player_in_area:
		if Input.is_action_just_pressed("interact"):
			print("dialogue")
			run_dialogue("intro")


func run_dialogue(dialogue_string):
	is_chatting = true
	
	Dialogic.start(dialogue_string)

func _on_chat_detection_body_entered(body):
	if body.has_method("shade"):
		player_in_area = true

func _on_chat_detection_body_exited(body):
	if body.has_method("shade"):
		player_in_area = false
