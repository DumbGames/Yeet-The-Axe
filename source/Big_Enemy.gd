extends KinematicBody2D


const UP = Vector2.UP
const GRAVITY = 9.8
var velocity = Vector2()
const SPEED = 60
var direction = 1
onready var anim = $AnimatedSprite
var health = 6
export (PackedScene) var BLOOD_PARTICLES: PackedScene = null

func _physics_process(delta):
	velocity.x *= 0.9
	velocity.y *= 0.8
	velocity.x = SPEED * direction
	velocity.y += GRAVITY
	velocity = move_and_slide(velocity, UP)
	if direction == 1:
		anim.play("right")
	if direction == -1:
		anim.play("left")
	if is_on_wall():
		direction = direction * -1
		$RayCast2D.position.x *= -1
		
	if $RayCast2D.is_colliding() == false:
		direction = direction * -1
		$RayCast2D.position.x *= -1

func minus_health():
	health -= 1
	if health == 0:
		queue_free()

func _on_Hitbox_body_entered(body):
	if body.name == "Player":
		body.die()
func ded():
	if BLOOD_PARTICLES:
		var blood = BLOOD_PARTICLES.instance()
		get_tree().current_scene.add_child(blood)
		blood.global_position = self.global_position
