extends Sprite2D

@export var Textures: Array = [preload("res://Assets/UniformBotje.png"), preload("res://Assets/FakeUniformBotje.png")]
@export var TextureNr: int = randi() % 2
@export var BotjePressed: bool = false

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
		TextureNr = randi() % 2
		texture = Textures[TextureNr]
		BotjePressed = false
	return FuncNr

func _on_botje_button_pressed():
	if texture == Textures[0] and not BotjePressed:
		print("FOUT DOM KUTKIND")
	elif texture == Textures[1] and not BotjePressed:
		print("juist + 500 Sociaal Krediet")
	BotjePressed = true
	
