extends Sprite2D

@export var ZoomingOut: bool = false
@export var InMonitor: bool = true

func _process(delta):
	if ZoomingOut:
		ZoomOut()
	if not InMonitor:
		get_tree().change_scene_to_file("res://DeskScene.tscn")

func _on_back_button_pressed():
	ZoomingOut = true

func ZoomOut():
	global_scale.x = ChangeVar(global_scale.x, 1, 2.148)
	global_scale.y = ChangeVar(global_scale.y, 1, 2.106)
	global_position.x = ChangeVar(global_position.x, 158.5, 160)
	global_position.y = ChangeVar(global_position.y, 85.5, 89.5)

func ChangeVar(vars, BigNr, SmallNr):
	var FuncNr: float = vars
	if FuncNr > BigNr:
		FuncNr = FuncNr + ((BigNr-SmallNr)/25)
	elif FuncNr <= BigNr:
		InMonitor = false
	return FuncNr
