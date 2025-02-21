extends RigidBody3D
class_name Player

const force_strength := 15

var input := Vector2.ZERO

func _process(_delta: float) -> void:
	if OS.get_name() == "Android":
		input.x = Input.get_gravity().x * -1
		input.y = Input.get_gravity().y
	else:
		input.x = Input.get_axis("move_right", "move_left")
		input.y = Input.get_axis("move_down", "move_up")

func _integrate_forces(state: PhysicsDirectBodyState3D) -> void:
	var magnitude := input.normalized()
	state.apply_central_force(
		Vector3(
			magnitude.x,
			0,
			magnitude.y
		) * force_strength
	)
