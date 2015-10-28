_cache1box = "Box_FIA_Ammo_F" createVehicle getMarkerPos "cache1";

sleep 5;
[
	WEST,
   		["Task1", "Find and destroy an enemy ammo cache box in 50m radius", "Destroy Cache", "Destroy Cache", getMarkerPos "cache1", "created"]        
] call FHQ_TT_addTasks;
sleep 10;
waituntil {!alive _cache1box};

["Task1", "succeeded"] call FHQ_TT_setTaskState; 
if (true)exitWith {};