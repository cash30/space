extends Control
@export var isMoving : bool = false
var titleScene     : PackedScene = load("res://Scenes/UI/title.tscn")
var playScene      : PackedScene = load("res://Scenes/main.tscn")
var settingsScene  : PackedScene = load("res://Scenes/UI/settings.tscn")
var winScene       : PackedScene = load("res://Scenes/UI/win.tscn")
var loseScene      : PackedScene = load("res://Scenes/UI/lose.tscn")
var infinateScene  : PackedScene = load("res://Scenes/main.tscn")
var howScene       : PackedScene = load("res://Scenes/UI/how.tscn")
var warningScene        : PackedScene = load("res://Scenes/UI/warning.tscn")
var grpaphics : String = "easy"
var canLose : bool = true ############################CHANGE WHEN NOT IN TESTING
var gameMode = "normal" #only other acceptable value is "infinite"
var isOnMenu = true
var shouldMoveMeteors = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	changeScene(titleScene)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#if isOnMenu and !is_current_scene(titleScene):
		#changeScene(titleScene)
	pass

func changeScene(scene : PackedScene):
	get_tree().change_scene_to_packed(scene)
	#if scene == titleScene:
		#isOnMenu = true
	#pass
#var packed : PackedScene


func is_current_scene(packed: PackedScene):
	var current = get_tree().current_scene
	if current != null:
		var current_path = current.scene_file_path
		var packed_path = packed.resource_path

		return current_path == packed_path
	else:
		return "current scene was found to be null in Globals.gd"
