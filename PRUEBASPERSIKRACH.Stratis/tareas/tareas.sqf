//chequeo si existe la base de datos de tareas
publicVariable "tareasobj";
_exists = "tareas" call iniDB_exists;
_tareacount = 0;
if (!isNil "_exists" && {_exists}) then
{	
//base de datos existe, leo cantidad total de tareas
_tareacount = ["tareas", "Info", "TOTAL", "STRING"] call iniDB_read;
_number = parseNumber _tareacount;
//parseo desde string a entero la cantidad
if (_number > 0) then { 
for [{_i=0},{_i<=_number},{_i=_i+1}] do {
//recorro la base de datos recopilando información
	_tareaid = format ["tarea%1", _i];
	_nombre = ["tareas", _tareaid, "Titulo", "STRING"] call iniDB_read;
	_estado = ["tareas", _tareaid, "Estado", "STRING"] call iniDB_read;
	//depende del nombre de la tarea hago una cosa u otra
switch (_nombre) do {
    case "Task1": {
	//depende del estado de la tarea concreta hago una cosa u otra
	switch (_estado) do {
	 case "succeeded": {
	  //caso tarea1 éxito
	 [WEST,
   		["Task1", "Find and destroy an enemy ammo cache box in 50m radius", "Destroy Cache", "Destroy Cache", getMarkerPos "cache1", "created"]        
] call FHQ_TT_addTasks;
["Task1", "succeeded"] call FHQ_TT_setTaskState;
};
 case "failed": {
	 //caso tarea1 fallada
	 [WEST,
   		["Task1", "Find and destroy an enemy ammo cache box in 50m radius", "Destroy Cache", "Destroy Cache", getMarkerPos "cache1", "created"]        
] call FHQ_TT_addTasks;
["Task1", "failed"] call FHQ_TT_setTaskState;
};
	 case "created": {
	 //caso tarea1 creada
	 _cache1box = "Box_FIA_Ammo_F" createVehicle getMarkerPos "cache1";
	 [WEST,
   		["Task1", "Find and destroy an enemy ammo cache box in 50m radius", "Destroy Cache", "Destroy Cache", getMarkerPos "cache1", "created"]        
] call FHQ_TT_addTasks;
["Task1", "created"] call FHQ_TT_setTaskState;
objetodetarea = _cache1box;
_cache1box addEventHandler ["killed",  {["Task1", "succeeded"] call FHQ_TT_setTaskState;}]
};
	};
	};
};
	
	};
};

} else {
//si no existe la base de datos de tareas, las creo de forma normal
_cache1box = "Box_FIA_Ammo_F" createVehicle getMarkerPos "cache1";
[
	WEST,
   		["Task1", "Find and destroy an enemy ammo cache box in 50m radius", "Destroy Cache", "Destroy Cache", getMarkerPos "cache1", "created"]        
] call FHQ_TT_addTasks;
objetodetarea = _cache1box;
_cache1box addEventHandler ["killed",  {["Task1", "succeeded"] call FHQ_TT_setTaskState;}]
};

publicVariable "objetodetarea";

