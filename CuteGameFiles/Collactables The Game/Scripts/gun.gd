extends Area2D


func _physics_process(delta):
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemies = enemies_in_range.front()
		look_at(target_enemies.global_position)


func shoot():
	const BULLET = preload("res://Collactables The Game/bullet.tscn")
	var New_bullet = BULLET.instantiate()
	New_bullet.global_position = %ShootingPoint.global_position
	New_bullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(New_bullet)


func _on_timer_timeout() -> void:
	shoot()
