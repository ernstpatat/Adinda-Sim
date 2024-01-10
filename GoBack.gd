extends Sprite2D

@onready var PlayerNode = get_node('GoBack')

func _ready():
	pass
	
func _process(delta):
	PlayerNode.connect("inmonitor",self,"DoSomething")
