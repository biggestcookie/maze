extends Camera3D

@export var follow_node: Node3D

const follow_speed := 2

func _physics_process(_delta: float) -> void:
	position.x = follow_node.position.x
	position.z = follow_node.position.z
	# position.x = move_toward(
	# 	position.x,
	# 	follow_node.position.x,
	# 	delta * follow_speed
	# )
	# position.z = move_toward(
	# 	position.z,
	# 	follow_node.position.z,
	# 	delta * follow_speed
	# )
