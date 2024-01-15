extends Sprite2D

@export var ZoomingOut: bool = false
@export var InDeur: bool = true
@export var Zoom: bool = true

func _process(delta):
	if ZoomingOut:
		ZoomOut()
	if not InDeur:
		get_tree().change_scene_to_file("res://DeskScene.tscn")

func _on_back_door_button_pressed():
	$GoBack.visible = false
	ZoomingOut = true

func ZoomOut():
	global_scale.x = ChangeVar(global_scale.x, 0.608, 2.099)
	global_scale.y = ChangeVar(global_scale.y, 0.758, 1.507)
	Zoom = false
	global_position.x = ChangeVar(global_position.x, 867.0, 576.0)
	Zoom = true
	global_position.y = ChangeVar(global_position.y, 159.0, 324.0)

func ChangeVar(vars, BigNr, SmallNr):
	var FuncNr: float = vars
	if Zoom == false:
		if FuncNr < BigNr:
			FuncNr += ((BigNr-SmallNr)/25)
		elif FuncNr >= BigNr:
			InDeur = false
	else:
		if FuncNr > BigNr:
			FuncNr += ((BigNr-SmallNr)/25)
		elif FuncNr <= BigNr:
			InDeur = false
	return FuncNr


