extends Area2D

var is_opening = false

func _on_body_entered(body):
	
	if is_opening:
		return  # Already opening, ignore repeat triggers
	if body.is_in_group("Player"):
		is_opening = true
		$AnimatedSprite2D.play("open")
		await $AnimatedSprite2D.animation_finished
		var current_scene_file = get_tree().current_scene.scene_file_path
		var next_level_file = current_scene_file.to_int() + 1
		var next_level_path = "res://levels/level" + str(next_level_file) + ".tscn"
		get_tree().change_scene_to_file(next_level_path)
