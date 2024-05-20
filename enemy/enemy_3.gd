extends Enemy
class_name Enemy_3

var lastPosition : Vector2 = position
var direction:  Vector2 = Vector2.ZERO

@onready var timer = $Timer
@onready var ray = $Ray


func _ready():
	$AnimatedSprite2D.play("grandma_idle")


func _physics_process(delta):
	_change_animation()
	if player == null: return
	nav_agent.target_position = player.global_position
	ray.target_position = direction * Vector2(9, 9)
	if timer.is_stopped() and ray.is_colliding():
		timer.start()
	#if timer.is_stopped() and lastPosition == position:
		#timer.start()
	#lastPosition = position
	if _seek:
		velocity = direction * speed
		move_and_slide()
	else:
		_seek = true


func _change_animation():
	var angle = rad_to_deg(velocity.normalized().angle())
	if angle < -30 and angle > -150:
		sprite.play("grandma_up")
	else:
		sprite.play("grandma_down")
	sprite.flip_h = abs(angle) > 90


func _on_timer_timeout():
	var next := nav_agent.get_next_path_position()
	direction = (next - global_position).normalized()
	
	#var angle = round(rad_to_deg(direction.angle()))
	#if angle <= 45 and angle >= -45:
		#direction = Vector2.RIGHT
	#elif angle > 45 and angle < 145:
		#direction = Vector2.DOWN
	#elif angle < -45 and angle > -145:
		#direction = Vector2.UP
	#else :
		#direction = Vector2.LEFT

