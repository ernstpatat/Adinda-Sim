extends Sprite2D

@export var Textures: Array = [preload("res://Assets/UniformBotje.png"), preload("res://Assets/FakeUniformBotje.png")]
@export var TextureNr: int = randi() % 2
@export var BotjePressed: bool = false
@export var MouseX: int = 0
@export var MouseY: int = 0
@export var CheckedOnce: bool = false

func _ready():
	texture = Textures[TextureNr]

func _process(delta):
	global_position.x = ChangeVar(global_position.x, 315.0, 250.0)
	global_position.y = ChangeVar(global_position.y, 85.0, 60.0)
	
func ChangeVar(vars, BigNr, SmallNr):
	var FuncNr: float = vars
	if FuncNr < BigNr:
		FuncNr += ((BigNr-SmallNr)/300)
	elif FuncNr >= BigNr:
		FuncNr = SmallNr
		if texture == Textures[1] and not BotjePressed:
			if CheckedOnce:
				print("Hoerenkind ge ebt een zonder uniform laten gaan")
				CheckedOnce = false
			else:
				CheckedOnce = true
		TextureNr = randi() % 2
		texture = Textures[TextureNr]
		BotjePressed = false
	return FuncNr

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if get_viewport_rect().has_point(to_local(event.position)):
			if texture == Textures[0] and not BotjePressed:
				print("FOUT DOM KUTKIND")
			elif texture == Textures[1] and not BotjePressed:
				print("juist + 500 Sociaal Krediet")
			BotjePressed = true
