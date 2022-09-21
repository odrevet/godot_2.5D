extends CanvasLayer

func _ready():
	$MarginContainer/Panel/Label.text = "INIT"
	#$MarginContainer.hide()

func set_text(text):
	print("Set text to")
	print(text)
	$MarginContainer.show()
	$MarginContainer/Panel/Label.text = text
