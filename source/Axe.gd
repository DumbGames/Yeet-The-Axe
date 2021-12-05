extends Area2D

var speed = 200
var acceleration = 5
export (PackedScene) var Axe_Particles: PackedScene = null

func _physics_process(delta):
	speed += acceleration
	position += transform.x * speed * delta


func _on_Axe_body_entered(body):
	if body.is_in_group("mobs"):
		body.ded()
		body.minus_health()
	if body.is_in_group("boss"):
		body.minus_health()
	if Axe_Particles:
		var particles = Axe_Particles.instance()
		get_tree().current_scene.add_child(particles)
		particles.global_position = self.global_position
	queue_free()
	

