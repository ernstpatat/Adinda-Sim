extends Sprite2D

@export var InDeur: bool = false
@export var Zooming: bool = false
@export var Zoom: bool = false

func _process(delta):
	if Zooming:
		ZoomIn()
	if InDeur:
		get_tree().change_scene_to_file("res://DeurScene.tscn")

func _on_deur_button_pressed():
	if not InDeur:
		Zooming = true
		
func ZoomIn():
	global_scale.x = ChangeVar(global_scale.x, 2.099, 0.608)
	global_scale.y = ChangeVar(global_scale.y, 1.507, 0.758)
	Zoom = true
	global_position.x = ChangeVar(global_position.x, 576.0, 867)
	Zoom = false
	global_position.y = ChangeVar(global_position.y, 324.0, 159.0)

func ChangeVar(vars, BigNr, SmallNr):
	var FuncNr: float = vars
	if Zoom == false:
		if FuncNr < BigNr:
			FuncNr += ((BigNr-SmallNr)/25)
		elif FuncNr >= BigNr:
			InDeur = true
	else:
		if FuncNr > BigNr:
			FuncNr += ((BigNr-SmallNr)/25)
		elif FuncNr <= BigNr:
			InDeur = true
	return FuncNr
