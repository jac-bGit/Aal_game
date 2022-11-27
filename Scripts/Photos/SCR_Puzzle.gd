extends Node2D

# Attributes
export (NodePath) var m_PositionsPath
onready var m_Positions = get_node(m_PositionsPath)

# Variables
var m_aPositions: Array
var m_iPositionsCount = 0
var m_iFilledPositions = 0

#-------------------------------------------------------------------------
func _ready() -> void:
	# Get positions 
	for pos in m_Positions.get_children():
		m_aPositions.append(pos)
		pos.connect("signal_OnFilled", self, "OnFilledPosition")
		m_iPositionsCount += 1

#-------------------------------------------------------------------------
func OnFilledPosition() -> void:
	m_iFilledPositions += 1
	
	if m_iFilledPositions == m_iPositionsCount:
		print("Finished!")

#-------------------------------------------------------------------------
func PositionById(var id: int) -> Node2D:
	for pos in m_aPositions:
		if pos.m_iId == id:
			return pos
	
	return null
