extends Area2D

# Attributes
export (NodePath) var m_TexturePath
onready var m_Texture = get_node(m_TexturePath)
export (Texture) var m_Image

export (NodePath) var m_PuzzlePiecePath
onready var m_PuzzlePiece = get_node(m_PuzzlePiecePath)

#-------------------------------------------------------------------------
func _ready() -> void:
	if m_Image != null:
		m_Texture.set_texture(m_Image)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
