extends Node

@export var speed: float = 1
#@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var enemy: Enemy
var sprite: AnimatedSprite2D

func _ready():
	enemy = get_parent()
	sprite = enemy.get_node("AnimatedSprite2D")

func _physics_process(delta: float) -> void:
	# Game Over
	if GameManager.is_game_over: return
	
	# Calcular direção
	var player_position = GameManager.player_position
	var difference = player_position - enemy.position
	var input_vector = difference.normalized()
	
	# Movimento
	enemy.velocity = input_vector * speed * 100
	enemy.move_and_slide()
	
	# Girar sprite
	if input_vector.x > 0:
		# desmarcar flip_h do Sprite2D
		sprite.flip_h = false
	elif input_vector.x < 0:
		# marcar flip_h do Sprite2D
		sprite.flip_h = true
