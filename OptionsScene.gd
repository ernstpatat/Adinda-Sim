extends Control

@export var Volume: int = 100

func _ready():
	$CheckButton/Label/VolumeSlider.value = Volume

func _process(delta):
	pass
	
func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://StartScene.tscn")

func _on_check_button_toggled(toggled_on):
	if toggled_on:
		$CheckButton/Label/VolumeSlider.editable = true
		$CheckButton/Label/VolumeSlider.value = Volume
	else:
		Volume = $CheckButton/Label/VolumeSlider.value
		$CheckButton/Label/VolumeSlider.value = 0
		$CheckButton/Label/VolumeSlider.editable = false
