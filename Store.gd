extends Node

const _path := "res://Saved.cfg"
var _config := ConfigFile.new()
var _file := File.new()
var _dir := Directory.new()
var _dataDefault := {
	"map": {
		"back": [],
		"fore": []
	}
}
var data := _dataDefault.duplicate()

func clear() -> void:
	data = _dataDefault.duplicate()

func read() -> Dictionary:
	var d := _dataDefault.duplicate()
	if _config.load(_path) == OK:
		for section in d.keys():
			for key in d[section]:
				if _config.has_section_key(section, key):
					d[section][key] = _config.get_value(section, key)
	return d

func write() -> void:
	for section in data.keys():
		for key in data[section]:
			_config.set_value(section, key, data[section][key])
	assert(_config.save(_path) == OK)
