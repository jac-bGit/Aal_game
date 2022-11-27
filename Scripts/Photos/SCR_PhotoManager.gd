class_name SCR_PhotoManager extends Node2D

# Attributes 
export(NodePath) var m_ConsumableManagerPath
onready var m_ConsumbleManager = get_node(m_ConsumableManagerPath)

# Variables 
var m_sInputRight = "ui_right"
var m_sInputLeft = "ui_left"

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
func _input(event):
	SelectPhoto(m_sInputRight, m_iSelected + 1)
	SelectPhoto(m_sInputLeft, m_iSelected - 1)
		
#-------------------------------------------------------------------------
# Switch content handling 
func SelectPhoto(action: String, id: int) -> void:
	if !Input.is_action_just_pressed(action):
		return
	
	get_child(m_iSelected).visible = false
	var count = get_child_count()
	
	# Limits
	if id >= count:
		id = 0
	elif id < 0:
		id = count - 1
		
	get_child(id).visible = true
	m_iSelected = id

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
