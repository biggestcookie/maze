extends Node

@onready var gravity_label: Label = $UI/Label
@onready var label_2: Label = $UI/Label2
@onready var label_3: Label = $UI/Label3

@onready var camera: Camera3D = $Camera3D
@onready var player: Player = $Player

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
	label_3.text = "Colliding: %s" % [player.ground_ray.is_colliding()]
	# label_2.text = "Camera rotation: %.1fx %.1fy %.1fz" % [
	# 	camera.rotation_degrees.x,
	# 	camera.rotation_degrees.y,
	# 	camera.rotation_degrees.z,
	# ]
