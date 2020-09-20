extends Control

onready var _persist := $Persist
onready var _back: TileMap = $Persist/Back
onready var _sprite: Sprite = $Persist/Sprite
onready var _fore: TileMap = $Persist/Fore
onready var _saveButton: Button = $Interface/Panel/VBox/Save
onready var _clearButton: Button = $Interface/Panel/VBox/Clear
onready var _loadButton: Button = $Interface/Panel/VBox/Load
var _packedScene := PackedScene.new()
const _path := "res://Saved.tscn"

func _ready() -> void:
	assert(_saveButton.connect("pressed", self, "_save"))
	assert(_clearButton.connect("pressed", self, "_clear"))
	assert(_loadButton.connect("pressed", self, "_load"))

func _save() -> void:
	assert(_packedScene.pack(_persist) == OK)
	assert(ResourceSaver.save(_path, _packedScene) == OK)

func _clear() -> void:
	_back.clear()
	_fore.clear()

func _load() -> void:
	var test := ResourceLoader.load(_path)
	_persist = test
