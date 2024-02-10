extends ProgressBar

@export var Value: int = 85

func _value_changed(new_value):
	Value = new_value
	if 0 < new_value < 20:
		$RicoFace.texture = preload("res://Assets/RicoBoos.png")
	elif 19 < new_value < 40:
		$RicoFace.texture = preload("res://Assets/RicoBeetjeBoos.png")
	elif 39 < new_value < 60:
		$RicoFace.texture = preload("res://Assets/RicoMedium.png")
	elif 59 < new_value < 80:
		$RicoFace.texture = preload("res://Assets/RicoBeetjeBlij.png")
	elif 79 < new_value < 100:
		$RicoFace.texture = preload("res://Assets/RicoBlij.png")

func _on_botje_decrease_bar():
	set_value_no_signal(Value-5)

func _on_botje_increase_bar():
	set_value_no_signal(Value+5)
