extends CharacterBody2D


const SPEED = 900.0
const JUMP_VELOCITY = -400.0

@onready var wall_detector := $wall_detector as RayCast2D
@onready var sprite_enemy := $"sprite-enemy" as Sprite2D
@onready var anim := $anim as AnimationPlayer
var direction := 1

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	if wall_detector.is_colliding():
		direction *= -1
		wall_detector.scale.x *= -1

	if direction == 1:
		sprite_enemy.flip_h = false
	else:
		sprite_enemy.flip_h = true
	velocity.x = direction * SPEED * delta
	
	move_and_slide()


func _on_anim_animation_finished(anim_name: StringName) -> void:
	if anim_name == "hurt":
		queue_free()
