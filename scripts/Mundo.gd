extends Node2D
@onready var jogador = $jogador
@onready var camera_2d = $Camera2D

func _ready():
	jogador.seguir_camera(camera_2d)
