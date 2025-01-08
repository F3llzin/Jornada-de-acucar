extends Area2D
@onready var collision = $collision
@onready var espinhos = $espinhos

# Called when the node enters the scene tree for the first time.
func _ready():
	collision.shape.size = espinhos.get_rect().size

func _on_body_entered(body):
	if body.name == "jogador" && body.has_method("tomar_dano"):
		body.tomar_dano(Vector2(0, -250))
