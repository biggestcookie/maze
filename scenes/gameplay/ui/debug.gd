extends Node

@onready var gravity_label: Label = $Label
@onready var label_2: Label = $Label2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var input := Vector2(
		Input.get_gravity().normalized().x,
		Input.get_gravity().normalized().y,
	)
	gravity_label.text = "Accelerometer: %.2fx %.2fy" % [
		input.x,
		input.y,
	]
	var normalized_accel := Input.get_gravity().normalized()
	var tilt_rotation := Basis(
		Vector3(0, 0, 1),
		normalized_accel.x * 0.1
	) * Basis(
		Vector3(1, 0, 0),
		normalized_accel.y * 0.1
	)
	var cam_rotation := (
		Basis(
			Vector3(1, 0, 0),
			deg_to_rad(-90)
		) * Basis(
			Vector3(0, 1, 0),
			deg_to_rad(-180)
		) * tilt_rotation
	).get_euler()
	label_2.text = "Camera rotation: %.1fx %.1fy %.1fz" % [cam_rotation]
