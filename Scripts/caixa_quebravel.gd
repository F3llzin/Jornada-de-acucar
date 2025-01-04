extends CharacterBody2D
const pedacos_caixa = preload("res://pedacos_caixa.tscn")
const coletavel_instance = preload("res://coletavel_ridge.tscn")

@onready var anim = $anim
@onready var spawn_coin = $spawn_coin


@export var pedacos : PackedStringArray
@export var hit = 3
var impulso = 200

func quebrar_sprite():
	for piece in pedacos.size():
		var pedacos_instance = pedacos_caixa.instantiate()
		get_parent().add_child(pedacos_instance)
		pedacos_instance.get_node("texture").texture = load(pedacos[piece])
		pedacos_instance.global_position = global_position
		pedacos_instance.apply_impulse(Vector2(randi_range(-impulso,impulso), randi_range(-impulso, -impulso * 2)))
	queue_free()

func criar_coletavel():
	var coletavel = coletavel_instance.instantiate()
	get_parent().call_deferred("add_child", coletavel)
	coletavel.global_position = spawn_coin.global_position
	coletavel.apply_impulse(Vector2(randi_range(-50,50), -150))
