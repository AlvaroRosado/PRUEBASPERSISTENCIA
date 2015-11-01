//GUARDANDO BASE DE DATOS

//espera hasta que se han creado en su caso las tareas
waitUntil {!isNil "FHQ_TTI_tasks"};

//GUARDANDO TAREAS
_tareacount = 0;
FHQ_TTI_TaskList call FHQ_TTI_UpdateTaskList;
{
	_tarea = [(_x select 1) call FHQ_TTI_getTaskName];
	_titulo = _tarea select 0;
	_estado = [_titulo] call FHQ_TT_getTaskState;
	//prevengo que se le de estado asignada
	if (_estado == "assigned") then {
	_estado = "created";
	};
	_tareacount = _tareacount + 1;
	[[_tareacount, _titulo,_estado], "sfn_guardartarea", false, false, false] call BIS_fnc_MP;

} forEach FHQ_TTI_TaskList; 

//GUARDADO DE VEHÍCULOS 
_vehCount = 0;
{
			_veh = _x;
if (alive _veh  &&  !(_veh isKindOf "Man" || _veh isKindOf "StaticWeapon")) then
{		
	if (!isNil {_veh getVariable ["objdetarea", ""]}) then {
	_esobjtarea = _veh getVariable ["objdetarea", ""];
	if !(_esobjtarea == "si") then {
	_nombre = vehicleVarName _veh;
	_vehCount = _vehCount + 1;
	_props = [_veh,_nombre] call fn_getVehicleProperties;
	[[_veh, _vehCount,_props], "sfn_guardarvehiculo", false, false, false] call BIS_fnc_MP;
	};
	};
	
};
} forEach allMissionObjects "AllVehicles";

//GUARDADO DE CAJAS DE MUNICIÓN 

_objCount = 0;

{
	_obj = _x;
if (alive _obj) then
{	
	if (!isNil {_obj getVariable ["objdetarea", ""]}) then {
	_esobjtarea = _obj getVariable ["objdetarea", ""];
	if !(_esobjtarea == "si") then {
		_nombre = vehicleVarName _obj;
	_objCount = _objCount + 1; 
	_props = [_obj,_nombre] call fn_getboxProperties;
	[[_obj, _objCount,_props], "sfn_guardarcaja", false, false, false] call BIS_fnc_MP;	
	};
	};
};	

} forEach allMissionObjects "ReammoBox_F";

//GUARDADO TODO otros

	_otrosCount = 0;
	{
				_otros = _x;
	if (alive _otros  &&  !(_otros isKindOf "AllVehicles" || _otros isKindOf "Man" || _otros isKindOf "ReammoBox_F" || _otros isKindOf "Logic" || _otros isKindOf "ThingEffect" || _otros isKindOf "Wreck" || _otros isKindOf "WeaponHolder" ) && (_otros isKindOf "Building" || _otros isKindOf "Thing") ) then 
	{		
		if (!isNil {_otros getVariable ["objdetarea", ""]}) then {
			_esobjtarea = _otros getVariable ["objdetarea", ""];
		if !(_esobjtarea == "si") then {
		_nombre = vehicleVarName _otros;
		_otrosCount = _otrosCount + 1;
		_props = [_otros,_nombre] call fn_getObjectProperties;
		[[_otros, _otrosCount,_props], "sfn_guardarotros", false, false, false] call BIS_fnc_MP;
		};	
		};		
	};
	} forEach allMissionObjects "All";
	hint format ["Base de Datos Guardada!\n Número de vehículos guardados: %1\n  Número de cajas guardadas: %2\n Número de tareas guardadas: %3\n Número de objetos guardados: %4\n",_vehcount,_objCount,_tareacount,_otrosCount];
	[[_vehCount], "fn_guardartotalveh", false, false, false] call BIS_fnc_MP;
	[[_objCount], "fn_guardartotalcaj", false, false, false] call BIS_fnc_MP;
	[[_tareacount], "fn_guardartotaltareas", false, false, false] call BIS_fnc_MP;
	[[_otrosCount], "fn_guardartotalotros", false, false, false] call BIS_fnc_MP;

