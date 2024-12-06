extends CharacterBody2D

func _enter_tree() -> void:
	set_multiplayer_authority(name.to_int())

func _ready() -> void:
	$Camera2D.enabled = is_multiplayer_authority()

func _physics_process(delta: float) -> void:
	if !is_multiplayer_authority():
		return
	
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") * 400
	move_and_slide()
