extends KinematicBody2D

const speed = 200
const jumpforce = 200
const up = Vector2.UP
var velocity = Vector2()
const gravity = 9.8
const max_fallspeed = 10
export (PackedScene) var Axe
onready var anim = $AnimatedSprite

func _physics_process(delta):
	if Input.is_action_pressed("right"):
		velocity.x = speed
		anim.play("Right")
	elif Input.is_action_pressed("left"):
		velocity.x = -speed
		anim.play("Left")
	if Input.is_action_just_pressed("throw"):
		throw()
	velocity.x *= 0.9
	if Input.is_action_just_pressed("jump") && is_on_floor():
		velocity.y = -jumpforce
	else:
		apply_gravity()
	move()

func move():
	velocity = move_and_slide(velocity, up)
func apply_gravity():
	velocity.y += gravity
	if gravity >  max_fallspeed:
		velocity.y = max_fallspeed
func throw():
	var a = Axe.instance()
	owner.add_child(a)
	a.transform = $Right.global_transform
	$Axe_sfx.play()

func die():
	get_tree().change_scene("res://scenes/Title .tscn")

func _on_AnimationPlayer_animation_finished(ded):
	die()


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene("res://scenes/Ending.tscn")
