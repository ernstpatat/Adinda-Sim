extends Sprite2D

@export var InMonitor: bool = false
@export var Zooming: bool = false

func _ready():
	$Deur.visible = true

func _process(delta):
	if Zooming:
		ZoomIn()
	if InMonitor:
		get_tree().change_scene_to_file("res://MonitorScene.tscn")

func _on_monitor_button_pressed():
	if not InMonitor:
		Zooming = true
		$Deur.visible = false
		
func ZoomIn():
	global_scale.x = ChangeVar(global_scale.x, 0.412, 0.188)
	global_scale.y = ChangeVar(global_scale.y, 0.408, 0.188)
	global_position.x = ChangeVar(global_position.x, 160.0, 158.75)
	global_position.y = ChangeVar(global_position.y, 90.0, 85)

func ChangeVar(vars, BigNr, SmallNr):
	var FuncNr: float = vars
	if FuncNr < BigNr:
		FuncNr += ((BigNr-SmallNr)/25)
	elif FuncNr >= BigNr:
		InMonitor = true
	return FuncNr
