extends Area2D


func _on_body_entered(body):
	body.death_fall_zone()
