extends Node

const _path := "res://Saved.cfg"
var _config := ConfigFile.new()
var _file := File.new()
var _dir := Directory.new()
var _dataDefault := {
	"map": {
		"back": {},
		"fore": {}
	}
}
var data := _dataDefault.duplicate()

func clear() -> void:
	data = _dataDefault.duplicate()

func read() -> void:
	var d := _dataDefault.duplicate()
	if _config.load(_path) == OK:
		for section in d.keys():
			for key in d[section]:
				if _config.has_section_key(section, key):
					d[section][key] = _config.get_value(section, key)
	data = d

func write() -> void:
	for section in data.keys():
		for key in data[section]:
			_config.set_value(section, key, data[section][key])
	assert(_config.save(_path) == OK)

func setMap(map: TileMap, key: String) -> void:
	data.map.back = {}
	for i in map.get_used_cells():
		var id = map.get_cellv(i)
		var flipX = map.is_cell_x_flipped(i.x, i.y)
		var flipY = map.is_cell_y_flipped(i.x, i.y)
		var rot90 = map.is_cell_transposed(i.x, i.y)
		var coord = map.get_cell_autotile_coord(i.x, i.y)
		data.map[key][i] = [id, flipX, flipY, rot90, coord]

func getMap(map: TileMap, key: String) -> void:
	for k in data.map[key].keys():
		var i = data.map[key][k]
		map.set_cellv(k, i[0], i[1], i[2], i[3]. id[4])
