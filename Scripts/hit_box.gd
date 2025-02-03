extends Area2D




func _on_body_entered(body: Node2D):
	if body.name == "jogador":
		body.velocity.y = -body.jump_velocity
		owner.anima__o.play("Dano")
