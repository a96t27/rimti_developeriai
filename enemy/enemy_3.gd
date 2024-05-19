extends Enemy
class_name Enemy_3

var lastPosition : Vector2 = position
@onready var timer = $Timer

var direction:  Vector2 = Vector2.ZERO

func _physics_process(delta):
	_change_animation()
	if player == null: return
	nav_agent.target_position = player.global_position
	if timer.is_stopped() and lastPosition == position:
		timer.start()
	lastPosition = position
	if _seek:
		velocity = direction * speed
		move_and_slide()
	else:
		_seek = true


func _change_animation():
	var angle = rad_to_deg(velocity.normalized().angle())
	if angle < -30 and angle > -150:
		sprite.play("rabbit_up")
	elif angle > 30 and angle < 150:
		sprite.play("rabbit_down")
	else:
		sprite.play("rabbit_side")
	sprite.flip_h = abs(angle) > 90


func enemy():
	pass


func _on_timer_timeout():
	var next := nav_agent.get_next_path_position()
	direction = (next - global_position).normalized()
	var angle = round(rad_to_deg(direction.angle()))
	if angle <= 45 and angle >= -45:
		direction = Vector2.RIGHT
	elif angle > 45 and angle < 145:
		direction = Vector2.DOWN
	elif angle < -45 and angle > -145:
		direction = Vector2.UP
	else :
		direction = Vector2.LEFT

