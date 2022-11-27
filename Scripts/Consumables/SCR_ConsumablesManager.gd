# Node for managing using consumables and managing their effects
class_name SRC_ConsumableManager extends Node2D

#-------------------------------------------------------------------------
# Class to hold current state
class EffectState:
	var m_iLevel = 0
	var m_cMaxColor = Color.white
	var m_cColor = Color.white

#-------------------------------------------------------------------------
# Attributes
export var m_iEffectLevelMax = 5

# Variables
var m_aEffectStates: Array

# Signals
signal signal_OnEffectChange
signal signal_OnColorChange

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Setup comsumbles
	for consumable in get_children():
		consumable.connect("signal_OnUse", self, "OnComsumableUse")
		
	# Setup states 
	for i in SCR_Consumable.EEffect.EnumSize:
		m_aEffectStates.append(EffectState.new())

#-------------------------------------------------------------------------
# Calculate effect color from white to current state
func EffectColor(var color: Color, var level: int) -> Color:
	var perc = abs(float(level) / float(m_iEffectLevelMax))
	var res = Color.white - (Color.white - color) * perc
	res.a = 1
	
	return res
	
#-------------------------------------------------------------------------
# Combine colors from given effects
func MixColor(var effects: Array) -> Color:
	var res = Color.black
	
	for effect in effects:
		res += effect.m_cColor
	
	return res / effects.size()
	
#-------------------------------------------------------------------------
# Callbacks
#-------------------------------------------------------------------------

#-------------------------------------------------------------------------
func OnComsumableUse(var consumable: SCR_Consumable) -> void:
	# Setup effect state
	var effect = m_aEffectStates[consumable.m_EffectType];
	
	if abs(effect.m_iLevel + consumable.m_iStep) <= m_iEffectLevelMax:
		# Change max color only if reversing effect 
		if abs(effect.m_iLevel + consumable.m_iStep) == 0 or effect.m_iLevel == 0:
			effect.m_cMaxColor = consumable.m_cColor
		
		# Apply consumable
		effect.m_iLevel += consumable.m_iStep
		effect.m_cColor = EffectColor(effect.m_cMaxColor, effect.m_iLevel)
	
	#print(consumable.m_EffectType, ". effect to: ", effect.m_iLevel)
	#emit_signal("signal_OnEffectChange", effect)
	
	var colorMix = MixColor(m_aEffectStates)
	emit_signal("signal_OnColorChange", colorMix)
