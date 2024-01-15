extends Node2D

@export var meldingsfiches_dict := {}
var index = 1
var config = ConfigFile.new()
var running = true

func _ready():
	config.load("res://fiches.cfg")

func _on_exit_button_pressed():
	get_tree().change_scene_to_file("res://MonitorScene.tscn")

func _on_submit_pressed():
	var config_length = config.get_sections().size()
	var titel = $Titel.text
	var naam = $"Naam leerling".text
	var info = $Beschrijving.text
	config.set_value(str(config_length), "naam", naam)
	config.set_value(str(config_length), "titel", titel)
	config.set_value(str(config_length), "info", info)
	config.save("res://fiches.cfg")
	
func _on_view_meldingsfiches_pressed():
	get_tree().change_scene_to_file("res://Meldingsfiches_all.tscn")
