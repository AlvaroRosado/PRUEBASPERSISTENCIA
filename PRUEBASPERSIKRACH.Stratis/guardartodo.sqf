//GUARDANDO BASE DE DATOS

//GUARDADO DE TAREAS Y ESTADO

waitUntil {!isNil "FHQ_TTI_tasks"};
_tareacount = 0;
FHQ_TTI_TaskList call FHQ_TTI_UpdateTaskList;
{
	_tareacount = _tareacount + 1;
	_tarea = [(_x select 1) call FHQ_TTI_getTaskName];
	_titulo = _tarea select 0;
	_estado = [_titulo] call FHQ_TT_getTaskState;
	[[_tareacount, _titulo,_estado], "sfn_guardartarea", false, false, false] call BIS_fnc_MP;

} forEach FHQ_TTI_TaskList; 

//GUARDADO DE VEHÍCULOS 
_vehCount = 0;
{
			_veh = _x;
if (alive _veh  &&  !(_veh isKindOf "Man" || _veh isKindOf "StaticWeapon")) then
{		
	_vehCount = _vehCount + 1;
	_props = [_veh] call fn_getVehicleProperties;
	[[_veh, _vehCount,_props], "sfn_guardarvehiculo", false, false, false] call BIS_fnc_MP;
}
else
{
};
} forEach allMissionObjects "AllVehicles";

//GUARDADO DE CAJAS DE MUNICIÓN 

_objCount = 0;

{
	_obj = _x;
if (alive _obj) then
{		
		_objCount = _objCount + 1; 
		_props = [_obj] call fn_getboxProperties;
		[[_obj, _objCount,_props], "sfn_guardarcaja", false, false, false] call BIS_fnc_MP;

}
else
{
};	

} forEach allMissionObjects "ReammoBox_F";

hint format ["Base de Datos Guardada!\n Número de vehículos guardados: %1\n  Número de cajas guardadas: %2\n Número de tareas guardadas: %3\n",_vehcount,_objCount,_tareacount];
[[_vehCount], "fn_guardartotalveh", false, false, false] call BIS_fnc_MP;
[[_objCount], "fn_guardartotalcaj", false, false, false] call BIS_fnc_MP;
[[_tareacount], "fn_guardartotaltareas", false, false, false] call BIS_fnc_MP;

