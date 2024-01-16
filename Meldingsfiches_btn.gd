extends Node2D

func _ready():
	$CanvasLayer/CenterContainer.hide()

func create_btn(index, naam, titel, info):
	var btn = $Button
	btn.text = str(index) + " - " + str(naam) + " - " + str(titel)
	$CanvasLayer/CenterContainer/popup/info.text = str(info)
	$CanvasLayer/CenterContainer/popup/naam.text = str(naam)
	$CanvasLayer/CenterContainer/popup/titel.text = str(titel)

func _on_button_pressed():
	$CanvasLayer/CenterContainer.show()
	$CanvasLayer/CenterContainer.global_position = get_viewport_rect().position


func _on_back_button_pressed():
	$CanvasLayer/CenterContainer.hide()
