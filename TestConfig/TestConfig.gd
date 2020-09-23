extends Control

onready var _back := $Back
onready var _fore := $Fore
onready var _saveButton: Button = $Interface/Panel/VBox/Save
onready var _clearButton: Button = $Interface/Panel/VBox/Clear
onready var _loadButton: Button = $Interface/Panel/VBox/Load
const _path := "res://Saved.tscn"

func _ready() -> void:
	assert(_saveButton.connect("pressed", self, "_save") == OK)
	assert(_clearButton.connect("pressed", self, "_clear") == OK)
	assert(_loadButton.connect("pressed", self, "_load") == OK)

func _clear() -> void:
	print("clear")
	_back.clear()
	_fore.clear()

func _save() -> void:
	print("save")
	# var packed := PackedScene.new()
	# assert(packed.pack(_parent) == OK)
	# assert(ResourceSaver.save(_path, packed) == OK)

func _load() -> void:
	print("load")
	# var packed: PackedScene = ResourceLoader.load(_path)
	# var scene = packed.instance()
	# for child in scene.get_children():
	# 	var exist = _parent.get_node(child.name)
	# 	if exist != null:
	# 		exist.free()
	# 		scene.remove_child(child)
	# 		_parent.add_child(child, true)
	# 		child.owner = _parent
