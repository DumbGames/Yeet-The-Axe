extends Node2D


func _on_TextureButton_pressed():
	get_tree().change_scene("res://scenes/World.tscn")
func _process(delta):
	if Input.is_action_pressed("ui_accept"):
		get_tree().change_scene("res://scenes/World.tscn")
