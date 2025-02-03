extends Area2D

@onready var transicao = get_parent().get_node("transicao")
@export var prox_Nivel : String = ""

func _on_body_entered(body):
	body.chegada()
	if body.name == "jogador" and !prox_Nivel == "":
		transicao.mudar_cena(prox_Nivel)
