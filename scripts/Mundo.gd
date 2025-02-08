extends Node2D
@onready var jogador = $jogador
@onready var cena_jogador = preload("res://jogador.tscn")
@onready var camera_2d = $Camera2D

func _ready():
	Global.jogador_posicao_inicial = $posicao_inicial
	Global.jogador = jogador
	Global.jogador.seguir_camera(camera_2d )
	Global.jogador.jogador_morreu.connect(recomecar)
	

func recomecar():
	await get_tree().create_timer(1.0).timeout
	var player = cena_jogador.instantiate()
	add_child(player)
	Global.jogador = player
	Global.jogador.seguir_camera(camera_2d )
	Global.jogador.jogador_morreu.connect(recomecar)
	Global.moeda = 0
	Global.vida_jogador = 3
	Global.respawn_player()
	#get_tree().reload_current_scene()

func game_over():
	get_tree().change_scene_to_file("res://game_over.tscn")
