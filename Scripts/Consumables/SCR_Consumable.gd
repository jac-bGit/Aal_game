extends Node2D

# Enum
enum EEffect{
	VISIBILITY,
	FOCUS
}

# Attributes
export var m_sName = "Consumable"
export var m_bPositive = true
export(int, 1, 10) var m_iAmmount = 1
export var m_cColor = Color.white
export(EEffect) var m_EffectType = EEffect.VISIBILITY

# Vars

# Signals
signal use

#-------------------------------------------------------------------------
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

#-------------------------------------------------------------------------
func _input_event(viewport, event, shape_idx):
	# Click
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		UseConsumable() 
	
#-------------------------------------------------------------------------
# Use comsumable and emit signal 
func UseConsumable():
	# Calculat step 
	var step = m_iAmmount
	if !m_bPositive:
		step = -step
	
	# Emit
	print("Using: ", m_sName,", affect: ", str(EEffect.keys()[m_EffectType]), ", by: ", step)
	emit_signal("use")
