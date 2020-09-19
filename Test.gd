extends Control

onready var _back: TileMap = $Back
onready var _sprite: Sprite = $Sprite
onready var _fore: TileMap = $Fore

func _ready():
	var scene = PackedScene.new()
	scene.pack(self)
	Utility.ok(ResourceSaver.save(_path, self))
