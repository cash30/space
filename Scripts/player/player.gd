extends CharacterBody3D


@export var speed = 5.0
var forwardSpeed = 10

func _ready() -> void:
	velocity.y = 0

func _physics_process(delta: float) -> void:

	forwardSpeed += 1 * delta
	
	
	#if Input.is_action_pressed("forwards"):
	position.z -= forwardSpeed * delta	
	#if Input.is_action_pressed("backwards"):
		#position.z += forwardSpeed * delta
	if Input.is_action_pressed("left"):
		position.x -= speed * delta 
	if Input.is_action_pressed("right"):
		position.x += speed * delta
	if Input.is_action_pressed("up"):
		position.y += speed * delta
	if Input.is_action_pressed("down"):
		position.y -= speed * delta
	move_and_slide()
