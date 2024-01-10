extends Sprite2D

@export var InRaam: bool = false
@export var Zooming: bool = false
@export var Zoom: bool = false

func _process(delta):
	if Zooming:
		ZoomIn()
	if InRaam:
		get_tree().change_scene_to_file("res://ReceptieRaamScene.tscn")

func _on_raam_button_pressed():
	if not InRaam:
		Zooming = true
		
func ZoomIn():
	global_scale.x = ChangeVar(global_scale.x, 1.203, 0.605)
	global_scale.y = ChangeVar(global_scale.y, 1.0, 0.75)
	global_position.x = ChangeVar(global_position.x, 576.0, 477.25)
	Zoom = true
	global_position.y = ChangeVar(global_position.y, 324.0, 380.0)
	Zoom = false

func ChangeVar(vars, BigNr, SmallNr):
	var FuncNr: float = vars
	if Zoom == false:
		if FuncNr < BigNr:
			FuncNr += ((BigNr-SmallNr)/25)
		elif FuncNr >= BigNr:
			InRaam = true
	else:
		if FuncNr > BigNr:
			FuncNr += ((BigNr-SmallNr)/25)
		elif FuncNr <= BigNr:
			InRaam = true
	return FuncNr
