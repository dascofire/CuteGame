extends CharacterBody2D


signal health_deplate
var health = 130.0


func _physics_process(delta):
	var Direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = Direction * 600
	move_and_slide()
	
	if velocity.length() > 0.0:
		$HappyBoo.play_walk_animation()
	else:
		$HappyBoo.play_idle_animation()

	const DAMAGE_RATE = 5.0
	var everlapping_moobs = %HurtBox.get_overlapping_bodies()
	if everlapping_moobs.size() > 0:
		health -= DAMAGE_RATE * everlapping_moobs.size() * delta
		$ProgressBar.value = health
		if  health <= 0.0:
			health_deplate.emit()
