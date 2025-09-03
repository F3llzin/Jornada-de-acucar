extends Node2D

@onready var folhas_particula = $ArvoreOutonoTipo1/folhasParticula
@export var emit_qnd_jogo_iniciar : bool

func _ready():
	folhas_particula.emitting = emit_qnd_jogo_iniciar

func Ativarparticula():
	folhas_particula.emitting = true

func Desativarparticula():
	folhas_particula.emitting = false
