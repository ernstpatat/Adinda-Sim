extends Node2D

func _on_desk_button_pressed():
	get_tree().change_scene_to_file("res://DeskScene.tscn")
