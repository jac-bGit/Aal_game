extends Node2D

# Attributes 
export(NodePath) var m_ConsumableManagerPath
onready var m_ConsumbleManager = get_node(m_ConsumableManagerPath)

# Variables 
var m_iSelected = 0
var m_aPhotos: Array

#-------------------------------------------------------------------------
func _ready() -> void:
	# Setup photos
	for photo in get_children():
		m_aPhotos.append(photo)
		photo.visible = false
	
	m_aPhotos[m_iSelected].visible = true
	
	# Comsumable manager setup
	m_ConsumbleManager.connect("signal_OnEffectChange", self, "OnEffectChange")
	m_ConsumbleManager.connect("signal_OnColorChange", self, "OnColorChange")

#-------------------------------------------------------------------------
# Callbacks
#-------------------------------------------------------------------------

#-------------------------------------------------------------------------
func OnEffectChange(var effect: SRC_ConsumableManager.EffectState) -> void:
	#modulate = effect.m_cColor
	pass
	
#-------------------------------------------------------------------------
func OnColorChange(var color: Color) -> void:
	modulate = color
	modulate.a = 1
