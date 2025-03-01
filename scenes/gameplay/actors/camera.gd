extends Camera3D

@export var follow_node: Node3D

const follow_speed := 5
const rotate_amount = 0.2

var follow_height_offset: float

func _ready() -> void:
	follow_height_offset = position.y
	position = Vector3(
		follow_node.position.x,
		follow_node.position.y + follow_height_offset,
		follow_node.position.z,
	)

func _physics_process(delta: float) -> void:
	# Move camera position
	position.x = follow_node.position.x
	position.y = move_toward(
		position.y,
		follow_node.position.y + follow_height_offset,
		delta * follow_speed
	)
	position.z = follow_node.position.z

	# Rotate camera with gyroscope
	# if OS.has_feature("mobile"):
	#     var normalized_accel := Input.get_gravity().normalized()
	#     var tilt_rotation := Basis(
	#         Vector3(0, 0, 1),
	#         normalized_accel.x * rotate_amount
	#     ) * Basis(
	#         Vector3(1, 0, 0),
	#         normalized_accel.y * rotate_amount
	#     )
	#     rotation = (
	#         Basis(
	#             Vector3(-1, 0, 0),
	#             deg_to_rad(-90)
	#         ) * Basis(
	#             Vector3(0, -1, 0),
	#             deg_to_rad(-180)
	#         ) * tilt_rotation
	#     ).get_euler()
