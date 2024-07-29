extends CanvasLayer

@onready var timer_label: Label = %TimeLabel
@onready var gold_label: Label = %GoldLabel

func _process(delta):
	#Update Timer
	timer_label.text = GameManager.time_elapsed_str
	gold_label.text = str(GameManager.gold_counter)


