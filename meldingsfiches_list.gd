extends Node2D

var config = ConfigFile.new()
var index = 0
var content = VBoxContainer.new()
var scroll_container = ScrollContainer.new()
signal to_meldingsfichescene
@onready var btn_scene = load("res://Meldingsfiches_btn.tscn")
func _ready():
	config.load("res://fiches.cfg")
	for item in config.get_sections():
		var btn = btn_scene.instantiate()
		btn.position.y = global_position.y + (index * 200)
		$Meldingsfiches_list.add_child(btn)
		var naam = config.get_value(str(item), "naam")
		var titel = config.get_value(str(item), "titel")
		var info = config.get_value(str(item), "info")
		print(naam)
		print(titel)
		btn.call("create_btn", index, naam, titel, info)
		index += 1
		print(item)
	
func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_WHEEL_UP:
		$VScrollBar.value -= $VScrollBar.page * 0.1
	elif event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
		$VScrollBar.value += $VScrollBar.page * 0.1

func _on_v_scroll_bar_value_changed(value):
	$Meldingsfiches_list.position.y = -value * 2
func _on_backbutton_pressed():
	to_meldingsfichescene.emit()


func _on_meldingsfiche_scene_update_fiches_list():
	config.load("res://fiches.cfg")
	var config_length = config.get_sections().size()
	var btn = btn_scene.instantiate()
	btn.position.y = global_position.y + (index * 200)
	$Meldingsfiches_list.add_child(btn)
	var naam = config.get_value(str(config_length), "naam")
	var titel = config.get_value(str(config_length), "titel")
	var info = config.get_value(str(config_length), "info")
	btn.call("create_btn", index, naam, titel, info)
	index += 1
