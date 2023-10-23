extends CanvasLayer

var show_fuel = true

func _on_health_updated(health):
	$Health.text = str(health) + "%"

func _on_fuel_updated(fuel):
	if show_fuel:
		$Fuel.text = str(fuel) 
	else: 
		$Fuel.text = ""
