extends Camera3D

@export var follow_node: Node3D

const follow_speed := 2
const follow_height_offset := 9.5

func _ready() -> void:
	position = Vector3(
		follow_node.position.x,
		follow_node.position.y + follow_height_offset,
		follow_node.position.z,
	)

func _physics_process(delta: float) -> void:
	position.x = follow_node.position.x
	position.y = move_toward(
		position.y,
		follow_node.position.y + follow_height_offset,
		delta * follow_speed
	)
	position.z = follow_node.position.z
