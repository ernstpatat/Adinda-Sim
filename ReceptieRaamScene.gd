extends Sprite2D

@export var ZoomingOut: bool = false
@export var InRaam: bool = true
@export var Zoom: bool = true

func _process(delta):
	if ZoomingOut:
		ZoomOut()
	if not InRaam:
		get_tree().change_scene_to_file("res://ReceptieScene.tscn")

func _on_go_back_pressed():
	$GoBack2.visible = false
	ZoomingOut = true

func ZoomOut():
	global_scale.x = ChangeVar(global_scale.x, 0.605, 1.203)
	global_scale.y = ChangeVar(global_scale.y, 0.75, 1.0)
	global_position.x = ChangeVar(global_position.x, 477.25, 576.0)
	Zoom = false
	global_position.y = ChangeVar(global_position.y, 380.0, 324.0)
	Zoom = true

func ChangeVar(vars, BigNr, SmallNr):
	var FuncNr: float = vars
	if Zoom == false:
		if FuncNr < BigNr:
			FuncNr += ((BigNr-SmallNr)/25)
		elif FuncNr >= BigNr:
			InRaam = false
	else:
		if FuncNr > BigNr:
			FuncNr += ((BigNr-SmallNr)/25)
		elif FuncNr <= BigNr:
			InRaam = false
	return FuncNr



