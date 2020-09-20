extends Node2D

func _ready() -> void:
	$Persist/Back.owner = self
	$Persist/Fore.owner = self
