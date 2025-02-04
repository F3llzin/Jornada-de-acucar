extends Area2D

@onready var transicao = get_parent().get_node("transicao_credits")
@export var creditos : String = ""

func _on_body_entered(body):
	body.final_jogo()
	if body.name == "jogador" and !creditos == "":
		transicao.mudar_cena(creditos)
