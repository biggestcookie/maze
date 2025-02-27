extends Node

@onready var label: Label = $Label
@onready var label_2: Label = $Label2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var input := Vector2(
		Input.get_gravity().normalized().x,
		Input.get_gravity().normalized().y,
	)
	label.text = "%.2fx %.2fy" % [
		input.x,
		input.y,
	]
	label_2.text = "Length: %.3f" % [input.length()]
