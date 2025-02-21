extends Node

@onready var label: Label = $Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var input := Input.get_gravity().normalized()
	label.text = "%.2fx %.2fy %.2fz" % [
		input.x,
		input.y,
		input.z
	]
	pass
