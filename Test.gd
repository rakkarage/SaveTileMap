extends Control

onready var _persist := $Persist
onready var _back: TileMap = $Persist/Back
onready var _sprite: Sprite = $Persist/Sprite
onready var _fore: TileMap = $Persist/Fore
onready var _saveButton: Button = $Interface/Panel/VBox/Save
onready var _clearButton: Button = $Interface/Panel/VBox/Clear
onready var _loadButton: Button = $Interface/Panel/VBox/Load
const _path := "res://Saved.tscn"

func _ready() -> void:
	assert(_saveButton.connect("pressed", self, "_save") == OK)
	assert(_clearButton.connect("pressed", self, "_clear") == OK)
	assert(_loadButton.connect("pressed", self, "_load") == OK)
	_sprite.modulate = Color.red

func _save() -> void:
	print("save")
	var packed := PackedScene.new()
	assert(packed.pack(_persist) == OK)
	assert(ResourceSaver.save(_path, packed) == OK)

func _clear() -> void:
	print("clear")
	_back.clear()
	_fore.clear()

func _load() -> void:
	print("load")
	var packed: PackedScene = ResourceLoader.load(_path)
	_persist = packed.instance()
