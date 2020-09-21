extends Control

onready var _parent := $Parent
onready var _saveButton0: Button = $Interface/Panel/HBox/VBox0/Save
onready var _clearButton0: Button = $Interface/Panel/HBox/VBox0/Clear
onready var _loadButton0: Button = $Interface/Panel/HBox/VBox0/Load
onready var _saveButton1: Button = $Interface/Panel/HBox/VBox1/Save
onready var _clearButton1: Button = $Interface/Panel/HBox/VBox1/Clear
onready var _loadButton1: Button = $Interface/Panel/HBox/VBox1/Load
const _path0 := "res://Saved.tscn"
const _path1 := "res://Saved.cfg"

func _ready() -> void:
	$Parent/Back.owner = _parent
	$Parent/Fore.owner = _parent
	assert(_saveButton0.connect("pressed", self, "_save0") == OK)
	assert(_clearButton0.connect("pressed", self, "_clear") == OK)
	assert(_loadButton0.connect("pressed", self, "_load0") == OK)
	assert(_saveButton1.connect("pressed", self, "_save1") == OK)
	assert(_clearButton1.connect("pressed", self, "_clear") == OK)
	assert(_loadButton1.connect("pressed", self, "_load1") == OK)

func _clear() -> void:
	print("clear")
	$Parent/Back.clear()
	$Parent/Fore.clear()

func _save0() -> void:
	print("save0")
	var packed := PackedScene.new()
	assert(packed.pack(_parent) == OK)
	assert(ResourceSaver.save(_path0, packed) == OK)

func _load0() -> void:
	print("load0")
	var packed: PackedScene = ResourceLoader.load(_path0)
	var scene = packed.instance()
	for child in scene.get_children():
		var exist = _parent.get_node(child.name)
		if exist != null:
			exist.free()
			scene.remove_child(child)
			_parent.add_child(child, true)
			child.owner = _parent

var data := {
	"map": {
		"back": [],
		"fore": []
	}
}

func _save1() -> void:
	print("save1")

func _load1() -> void:
	print("load1")
