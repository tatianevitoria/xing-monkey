extends Area2D


func _on_body_entered(body):
	if body.name == "player":
		body.velocity = Vector2(0, -400)
		owner.anim.play("hurt")
		#owner.queue_free()
