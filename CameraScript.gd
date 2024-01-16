extends Camera2D

@export var InMonitor: bool = false

func _on_raam_desk_button_pressed():
	if not InMonitor:
		global_position.x = 0

func _on_desk_raam_button_pressed():
	if not InMonitor:
		global_position.x = -319.8

func _on_desk_receptie_button_pressed():
	if not InMonitor:
		global_position.x = 320
	
func _on_directie_desk_button_pressed():
	if not InMonitor:
		global_position.x = 0

func _on_desk_disable_button():
	InMonitor = true

func _on_desk_enable_button():
	InMonitor = false
