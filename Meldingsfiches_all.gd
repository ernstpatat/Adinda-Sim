extends Node2D

var config = ConfigFile.new()
var index = 0
var content = VBoxContainer.new()
var scroll_container = ScrollContainer.new()
@onready var btn_scene = load("res://meldingsfiches_button.tscn")
func _ready():
	config.load("res://fiches.cfg")
	for item in config.get_sections():
		var btn = btn_scene.instantiate()
		btn.position.y = global_position.y + (index * 50)
		$fiches_btn_list.add_child(btn)
		var naam = config.get_value(str(item), "naam")
		var titel = config.get_value(str(item), "titel")
		var info = config.get_value(str(item), "info")
		btn.call("create_btn", index, naam, titel, info)
		index += 1
		print(item)
func _on_button_pressed():
	get_tree().change_scene_to_file("res://MeldingsFicheScene.tscn")
	
func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_WHEEL_UP:
		$VScrollBar.value -= $VScrollBar.page * 0.1
	elif event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
		$VScrollBar.value += $VScrollBar.page * 0.1


func _on_v_scroll_bar_value_changed(value):
	$fiches_btn_list.position.y = -value * 2
