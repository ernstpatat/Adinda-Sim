extends Node2D

func _on_exit_button_pressed():
	get_tree().change_scene_to_file("res://MonitorScene.tscn")

#var database = TextDatabase.new()
#database.load_from_path("res://meldingsfiches.cfg")

#var data = database.get_dictionary()

#for item in data:
	#print(item.description)
