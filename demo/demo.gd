extends Control

@onready var full_screen: Button = $"VBoxContainer/Full Screen"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# If web build, then change button name to Fullscreen, else set to Exit
	if OS.get_name() == "Web": full_screen.text = "Fullscreen"
	else: full_screen.text = "Exit"

func _on_full_screen_pressed() -> void:
	# If web, then force fullscreen mode, else quit app
	if OS.get_name() == "Web":
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	else:
		get_tree().quit()
