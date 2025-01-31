extends Node

var moeda = 0
var abates = 0
var vida_jogador = 3
var jogador = null
var jogador_posicao_inicial = null
var checkpoint_atual = null


func respawn_player():
	if checkpoint_atual != null:
		jogador.position = checkpoint_atual.global_position
	else:
		jogador.global_position = jogador_posicao_inicial.global_position
		get_tree().change_scene_to_file("res://game_over.tscn")
