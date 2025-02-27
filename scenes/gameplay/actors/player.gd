class_name Player
extends RigidBody3D

const force_strength := 10

var input := Vector2.ZERO

func _process(_delta: float) -> void:
	if OS.has_feature("mobile"):
		input.x = Input.get_gravity().normalized().x * -1
		input.y = Input.get_gravity().normalized().y
	else:
		input.x = Input.get_axis("move_right", "move_left")
		input.y = Input.get_axis("move_down", "move_up")


func _physics_process(_delta: float) -> void:
	var input_clipped := input
	if OS.has_feature("mobile"):
		input_clipped = (input
			if input.length() > 0.2
			else Vector2.ZERO
		)
	else:
		input_clipped *= .75
	
	apply_central_force(
		Vector3(
			input_clipped.x,
			0,
			input_clipped.y
		) * force_strength
	)
