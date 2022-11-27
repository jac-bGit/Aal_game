extends Node2D

# Signal
signal signal_OnFilled

func FillPosition() -> void:
	emit_signal("signal_OnFilled")
