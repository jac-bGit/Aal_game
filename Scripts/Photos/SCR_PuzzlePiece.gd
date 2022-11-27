extends Area2D

# Attributes
export (NodePath) var m_PosPath
onready var m_Pos = get_node(m_PosPath)
var m_bMoved = false

#-------------------------------------------------------------------------
func _input_event(viewport, event, shape_idx):
	# Click
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		MovePiece() 

#-------------------------------------------------------------------------
func MovePiece() -> void:
	if m_bMoved:
		return
	
	get_parent().remove_child(self)
	m_Pos.add_child(self)
	position = m_Pos.position
	
	m_bMoved = true
	m_Pos.FillPosition()
