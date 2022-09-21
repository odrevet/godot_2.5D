extends CanvasLayer

func _ready():
	$MarginContainer.hide()

func set_text(text):
	$MarginContainer.show()
	$MarginContainer/Panel/Label.text = text
