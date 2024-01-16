extends Node2D

var index = 1
var config = ConfigFile.new()
var running = true
signal to_meldingsficheslist
func _ready():
	config.load("res://fiches.cfg")

func _on_submit_pressed():
	var config_length = config.get_sections().size()
	var titel = $Titel.text
	var naam = $Naam.text
	var info = $Info.text
	config.set_value(str(config_length), "naam", naam)
	config.set_value(str(config_length), "titel", titel)
	config.set_value(str(config_length), "info", info)
	config.save("res://fiches.cfg")

func _on_view_fiches_pressed():
	to_meldingsficheslist.emit()
