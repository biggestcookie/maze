extends Node

@onready var player: Player = $Player
@onready var win_label: RichTextLabel = $UI/Win
@onready var win_area: Area3D = $Level/Level3/Win/Area3D

func _ready() -> void:
	win_label.visible = false
	win_area.body_entered.connect(on_win_body_entered)

func on_win_body_entered(_body: Node3D) -> void:
	player.paused = true
	print("WIN!")
	win_label.visible = true
