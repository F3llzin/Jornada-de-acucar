extends Control

@onready var contador_abate = $container/abates/contador_abate
@onready var contador = $container/moeda/contador
@onready var icone = $container/vida/icone
var vida_cheia = preload("res://Addons/Free/Menu/Buttons/Other/vida.png")
var vida_meia = preload("res://Addons/Free/Menu/Buttons/Other/vida 2.png")
var vida_menos_metade = preload("res://Addons/Free/Menu/Buttons/Other/vida 3.png")
var vida_vazia = preload("res://Addons/Free/Menu/Buttons/Other/vida 4.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	contador.text = str("%02d" % Global.moeda)
	contador_abate.text = str("%02d" % Global.abates)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	contador.text = str("%02d" % Global.moeda)
	contador_abate.text = str("%02d" % Global.abates)
	match Global.vida_jogador:
		0:
			icone.texture = vida_vazia
		1:
			icone.texture = vida_menos_metade
		2:
			icone.texture = vida_meia
		3:
			icone.texture = vida_cheia

