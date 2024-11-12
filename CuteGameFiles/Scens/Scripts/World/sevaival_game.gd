extends Node2D



func spawn_moob():
	var MOOB = preload("res://Scens/Enemy/moob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	MOOB.global_position = %PathFollow2D.global_position
	add_child(MOOB)


func _on_timer_timeout() -> void:
	spawn_moob()


func _on_player_health_deplate() -> void:
	%GameOver.visible = true
	get_tree().paused = true
