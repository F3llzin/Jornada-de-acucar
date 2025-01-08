extends Control

@onready var contador_abate = $container/abates/contador_abate
@onready var contador = $container/moeda/contador
@onready var icone = $container/vida/icone
@onready var contador_vida = $container/vida/contador_vida

# Called when the node enters the scene tree for the first time.
func _ready():
	contador.text = str("%02d" % Global.moeda)
	contador_abate.text = str("%02d" % Global.abates)
	contador_vida.text = str("%02d" % Global.vida_jogador)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	contador.text = str("%02d" % Global.moeda)
	contador_abate.text = str("%02d" % Global.abates)
	contador_vida.text = str("%02d" % Global.vida_jogador)
