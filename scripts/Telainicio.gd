extends Control
#se quiser animar esta tela, ep 27
@onready var button_start = $MarginContainer/HBoxContainer/VBoxContainer/Button_start


func _process(_delta):
	Global.moeda = 0
	Global.vida_jogador = 3
	Global.abates = 0


func _on_button_start_pressed():
	get_tree().change_scene_to_file("res://Mundo.tscn")
	

func _on_button_quit_pressed():
	get_tree().quit()

func _ready():
	button_start.grab_focus()
