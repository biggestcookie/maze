extends Node

@onready var player: Player = $Player
@onready var win_label: RichTextLabel = $UI/Win
@onready var win_area: Area3D = $Level/Level3/Win/Area3D

# # Debug
# @onready var gravity_label: Label = $UI/Label
# @onready var label_2: Label = $UI/Label2
# @onready var label_3: Label = $UI/Label3

func _ready() -> void:
	win_label.visible = false
	win_area.body_entered.connect(on_win_body_entered)

func on_win_body_entered(_body: Node3D) -> void:
	player.freeze = true
	print("WIN!")
	win_label.visible = true

# # Debug
# func _process(_delta: float) -> void:
# 	var input := Vector2(
# 		Input.get_gravity().normalized().x,
# 		Input.get_gravity().normalized().y,
# 	)
# 	gravity_label.text = "Accelerometer: %.2fx %.2fy" % [
# 		input.x,
# 		input.y,
# 	]
# 	label_3.text = "Colliding: %s" % [player.ground_ray.is_colliding()]
