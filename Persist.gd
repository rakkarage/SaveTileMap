extends Node2D

func _ready() -> void:
	$Back.owner = self
	$Fore.owner = self
