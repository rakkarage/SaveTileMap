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
	Store.setMap(_back, "back")
	Store.setMap(_fore, "fore")
	Store.write()

func _load() -> void:
	print("load")
	Store.read()
	Store.getMap(_back, "back")
	Store.getMap(_fore, "fore")
