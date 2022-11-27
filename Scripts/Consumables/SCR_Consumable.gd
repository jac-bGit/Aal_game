class_name SCR_Consumable extends Node2D

# Enum
enum EEffect{
	VISIBILITY,
	FOCUS, 
	EnumSize
}

# Attributes
export var m_sName = "Consumable"
export var m_bPositive = true
export(int, 1, 10) var m_iAmmount = 1
export var m_cColor = Color.white
export(EEffect) var m_EffectType = EEffect.VISIBILITY

# Vars
var m_iStep = 1

# Signals
signal signal_OnUse

#-------------------------------------------------------------------------
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Calculat step 
	m_iStep = m_iAmmount
	if !m_bPositive:
		m_iStep = -m_iStep

#-------------------------------------------------------------------------
func _input_event(viewport, event, shape_idx):
	# Click
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		UseConsumable() 
	
#-------------------------------------------------------------------------
# Use comsumable and emit signal 
func UseConsumable() -> void:
	# Emit
	#print("Using: ", m_sName,", affect: ", str(EEffect.keys()[m_EffectType]), ", by: ", m_iStep)
	emit_signal("signal_OnUse", self)
