extends Node3D
@export var meteor : PackedScene = load("res://Scenes/meteor/meteor.tscn")
@export var wall : PackedScene = load("res://Scenes/wall.tscn")
var meteorDistance : int = -200
var i = 0
var max_space_between = 10
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	spawnMeteors(200, 0, 200)
	
	
	createWal(-11, Vector3(5,0,-2))
	createWal(0, Vector3(10,5.5,-2))
	createWal(-11, Vector3(5,10,-2))
	createWal(0, Vector3(0,5.5,-2))
	
	if Globals.gameMode != "normal":
		createWal(-11, Vector3(5,0,-200))
		createWal(0, Vector3(10,5.5,-200))
		createWal(-11, Vector3(5,10,-200))
		createWal(0, Vector3(0,5.5,-200))
		
		createWal(-11, Vector3(5,0,-400))
		createWal(0, Vector3(10,5.5,-400))
		createWal(-11, Vector3(5,10,-400))
		createWal(0, Vector3(0,5.5,-400))
		
		createWal(-11, Vector3(5,0,-600))
		createWal(0, Vector3(10,5.5,-600))
		createWal(-11, Vector3(5,10,-600))
		createWal(0, Vector3(0,5.5,-600))
	
	
		#meteorInst.position = Vector3(0, 0, 0)

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var playerz = $player.position.z
	if playerz < meteorDistance and Globals.gameMode == "infinite":
		spawnMeteors(10, playerz - 790, playerz - 810)
		
		createWal(-11, Vector3(5,0, playerz - 800))
		createWal(0, Vector3(10,5.5,playerz - 800))
		createWal(-11, Vector3(5,10,playerz - 800))
		createWal(0, Vector3(0,5.5, playerz - 800))
		
		print("should spawn meteors")
		meteorDistance -= 10
	
	
	if $player.position.z < -230 and Globals.gameMode == "normal":
		print("i did it")
		Globals.changeScene(Globals.winScene)
		#print($player.position.z)

func createWal(rotation : int, pos : Vector3):
	var wallInst = wall.instantiate()
	add_child(wallInst)
	wallInst.rotate_y(-11)
	wallInst.rotate_z(rotation)
	wallInst.position = pos
	wallInst.scale.x = 20
	wallInst.scale.y = 5
	
func spawnMeteors(num : int, start : int, end : int):
	for _i in range(num):
		var meteorInst = meteor.instantiate()
		var scale = randi_range(0.8, 1.5)
		add_child(meteorInst)
		meteorInst.scale = Vector3(scale, scale, scale)
		meteorInst.position = Vector3(randf() * max_space_between, randf() * max_space_between, randf_range(start, -end))
		meteorInst.rotation = Vector3(scale, scale, scale)
