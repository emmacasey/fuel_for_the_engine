extends WorldEnvironment

@onready
var enemies
var drain:float = 0
var fuel:float = 100
var lagged_values:Array =[]
var ratio: int = 100

signal update_fuel 

# Called when the node enters the scene tree for the first time.
func _ready():
	enemies = get_node("../Enemies").find_children("enemy")
	for e in enemies:
		if e!=null:
			drain+=e.value
	lagged_values.resize(600)
	lagged_values.fill(drain)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	fuel-=drain*delta
	var current_value=0
	for e in enemies:
		if e!=null:
			current_value+=(e.value)
	lagged_values.append(current_value)
	fuel+=lagged_values.pop_front()*delta
			
	update_fuel.emit(int(fuel/100))

func fuel_engine(amount):
	fuel+=amount*100

