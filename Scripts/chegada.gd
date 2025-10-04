extends Area2D

var fase_completada = 1
@onready var transicao = get_parent().get_node("transicao")
@export var prox_Nivel : String = ""

func _on_body_entered(body):
	Global.fase += fase_completada
	body.chegada()
	if body.name == "jogador" and !prox_Nivel == "":
		transicao.mudar_cena(prox_Nivel)
