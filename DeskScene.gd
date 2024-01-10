extends Node2D

func _on_raam_button_pressed():
	get_tree().change_scene_to_file("res://RaamScene.tscn")

func _on_receptie_button_pressed():
	get_tree().change_scene_to_file("res://ReceptieScene.tscn")
