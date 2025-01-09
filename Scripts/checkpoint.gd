extends Area2D

var esta_ativado = false
@onready var anim = $anim
@onready var marcacao = $marcacao



func _on_body_entered(body):
	if body.name != "jogador" or esta_ativado:
		return
	checkpoint_ativo()


func checkpoint_ativo():
	Global.checkpoint_atual = marcacao
	anim.play("checkpoint")
	esta_ativado = true

func _on_anim_animation_finished():
	if anim.animation == "checkpoint":
		anim.play("idle")
