extends Node2D

func _on_exit_button_pressed():
	get_tree().change_scene_to_file("res://MonitorScene.tscn")

var database = TextDatabase.new()

var data = database.get_dictionary()
database.id_name = "test"
