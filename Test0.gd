extends Control

onready var _parent := $Parent
onready var _back: TileMap = $Parent/Back
onready var _sprite: Sprite = $Parent/Sprite
onready var _fore: TileMap = $Parent/Fore
onready var _saveButton: Button = $Interface/Panel/VBox/Save
onready var _clearButton: Button = $Interface/Panel/VBox/Clear
onready var _loadButton: Button = $Interface/Panel/VBox/Load
const _path := "res://Saved.tscn"

func _ready() -> void:
	_back.owner = _persist
	_fore.owner = _persist
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
	var scene = packed.instance()
	for child in scene.get_children():
		print(child.name)
		var exist = _persist.get_node(child.name)
		print(exist)
		if exist != null:
			exist.queue_free()
			scene.rem
			_persist.add_child(child)
			child.owner = _persist
