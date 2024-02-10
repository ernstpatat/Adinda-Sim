
extends Node2D

signal disable_button
signal enable_button

func _on_deur_button_pressed():
	$Deur.global_position.x = 160
	$Deur.global_position.y = 90
	$Deur.global_scale.x = 1
	$Deur.global_scale.y = 1
	$DeurButton.visible = false
	$Monitor.visible = false
	$Desk.visible = false
	$DeurGoBackButton.visible = true

func _on_go_back_button_pressed():
	$Deur.global_position.x = 246.5
	$Deur.global_position.y = 58.5
	$Deur.global_scale.x = 0.378
	$Deur.global_scale.y = 0.372
	$DeurButton.visible = true
	$Monitor.visible = true
	$Desk.visible = true
	$DeurGoBackButton.visible = false

func _on_monitor_button_pressed():
	$Monitor.global_position.x = 160
	$Monitor.global_position.y = 90
	$Monitor.global_scale.x = 1
	$Monitor.global_scale.y = 1
	$Monitor.texture = preload('res://Assets/MonitorOn.png')
	$MonitorGoBackButton.visible = true
	$MonitorButton.visible = false
	$MeldingsFicheButton.visible = true
	$FicheBackButton.visible = true
	disable_button.emit()

func _on_monitor_go_back_button_pressed():
	$Monitor.global_position.x = 158.5
	$Monitor.global_position.y = 85
	$Monitor.global_scale.x = 0.453
	$Monitor.global_scale.y = 0.456
	$Monitor.texture = preload('res://Assets/MonitorOff.png')
	$MonitorGoBackButton.visible = false
	$MonitorButton.visible = true
	$MeldingsFicheButton.visible = false
	$FicheBackButton.visible = false
	enable_button.emit()

func _on_meldings_fiche_button_pressed():
	$MeldingsficheScene.visible = true
	$FicheBackButton.visible = true

func _on_fiche_back_button_pressed():
	$MeldingsficheScene.visible = false
	$FicheBackButton.visible = false

func _on_meldingsfiches_list_to_meldingsfichescene():
	$MeldingsficheScene.visible = true
	$Meldingsfichelist.visible = false

func _on_meldingsfiche_scene_to_meldingsficheslist():
	$MeldingsficheScene.visible = false
	$Meldingsfichelist.visible = true
