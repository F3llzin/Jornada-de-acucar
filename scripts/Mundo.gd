extends Node2D
@onready var jogador = $jogador
@onready var camera_2d = $Camera2D

func _ready():
	jogador.seguir_camera(camera_2d )
	jogador.jogador_morreu.connect(recomecar)
	Global.moeda = 0
	Global.abates = 0
	Global.vida_jogador = 3
	
func recomecar():
	await get_tree().create_timer(1.0).timeout
	get_tree().reload_current_scene()
