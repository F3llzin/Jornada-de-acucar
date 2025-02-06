extends Control
@onready var button_inicio = $HBoxContainer/Button_inicio


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.moeda = 0
	Global.vida_jogador = 3
	Global.abates = 0
	button_inicio.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_inicio_pressed():
	get_tree().change_scene_to_file("res://Telainicio.tscn")
	


func _on_button_sair_pressed():
	get_tree().quit()
