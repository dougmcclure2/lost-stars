extends Sprite2D

var player_in_area = false

var is_chatting = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var e_prompt = get_node("EPrompt")
	if player_in_area == true:
		e_prompt.visible = true
		if Input.is_action_just_pressed("interact"):
			run_dialogue("intro")


func run_dialogue(dialogue_string):
	is_chatting = true
	
	Dialogic.start(dialogue_string)

func _on_detect_body_entered(body: CharacterBody2D) -> void:
	if body.has_method("shade"):
		player_in_area = true

func _on_detect_body_exited(body: CharacterBody2D) -> void:
	if body.has_method("shade"):
		player_in_area = false
