extends RigidBody3D
class_name Player

const force_strength := 2

var input := Vector2.ZERO

func _process(_delta: float) -> void:
	input.x = Input.get_accelerometer().x
	input.y = Input.get_accelerometer().y * -1

func _integrate_forces(state: PhysicsDirectBodyState3D) -> void:
	var magnitude := input.normalized()
	state.apply_force(
		Vector3(
			magnitude.x,
			0,
			magnitude.y
		) * force_strength
	)
