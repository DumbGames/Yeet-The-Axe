extends StaticBody2D

var health = 12

func minus_health():
	health -= 1

func _process(delta):
	if health == 0:
		$AnimationPlayer.play("ball")
		$CPUParticles2D.emitting = true
		$AudioStreamPlayer.play()




func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
	
