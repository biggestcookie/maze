extends Button

func _ready() -> void:
	self.pressed.connect(self._button_pressed)

func _button_pressed() -> void:
	get_tree().reload_current_scene()
