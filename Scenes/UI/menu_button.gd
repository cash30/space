extends MenuButton

func _ready() -> void:
	var popup = get_popup()
	popup.add_item("Fancy", 0)
	popup.add_item("Easy", 1)

	popup.id_pressed.connect(_on_item_selected)

func _on_item_selected(id: int) -> void:
	match id:
		0:
			Globals.grpaphics = "fancy"
		1:
			Globals.grpaphics = "easy"
