extends CharacterBody2D

@export var Textures: Array = [preload("res://Assets/UniformBotje.png"), preload("res://Assets/FakeUniformBotje.png")]
@export var TextureNr: int = randi() % 2
@export var BotjePressed: bool = false
@export var MouseX: int = 0
@export var MouseY: int = 0
@export var CheckedOnce: bool = false
@export var Part1: bool = true
@export var FuncNr: float = 0

signal IncreaseBar
signal DecreaseBar

func _ready():
	$BotjeSprite.texture = Textures[TextureNr]
	velocity = Vector2(0, 0)

func _process(delta):
	move_and_collide(velocity * delta)
	if global_position.x >= 70 and global_position.x <= 80:
		global_position.x = 120
		global_position.y = 96
		velocity = Vector2(0, -0)
	elif global_position.x >= 235:
		global_position.x = 0
		global_position.y = 0
		velocity = Vector2(0, 0)
		if $BotjeSprite.texture == Textures[1] and not BotjePressed:
			DecreaseBar.emit()
		TextureNr = randi() % 2
		$BotjeSprite.texture = Textures[TextureNr]
		BotjePressed = false


func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if event.position.x :
			print('lol')
			if $BotjeSprite.texture == Textures[0] and not BotjePressed:
				DecreaseBar.emit()
			elif $BotjeSprite.texture == Textures[1] and not BotjePressed:
				IncreaseBar.emit()
			BotjePressed = true
