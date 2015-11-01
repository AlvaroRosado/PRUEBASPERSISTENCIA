_exists = "Otros" call iniDB_exists;
_objcount = 0;
if (!isNil "_exists" && {_exists}) then
{	
	_objcount = ["Otros", "Info", "TOTAL", "STRING"] call iniDB_read;
	_number = parseNumber _objcount;

	if (_number > 0) then {
	{	
		_otros = _x;
			if (alive _otros  &&  !(_otros isKindOf "AllVehicles" || _otros isKindOf "Man" || _otros isKindOf "ReammoBox_F" || _otros isKindOf "Logic" || _otros isKindOf "ThingEffect" || _otros isKindOf "Wreck" || _otros isKindOf "WeaponHolder") && (_otros isKindOf "Building" || _otros isKindOf "Thing")) then
			{		
				deleteVehicle _otros;
			};
	} forEach allMissionObjects "All";
	

for [{_i=1},{_i<=_number},{_i=_i+1}] do {
	_otrosID = format ["obj%1", _i];
	_class = ["Otros", _otrosID, "Class", "STRING"] call iniDB_read;
	_pos = ["Otros", _otrosID, "Position", "ARRAY"] call iniDB_read;
	_initobj = ["Otros", _otrosID, "Init", "STRING"] call iniDB_read;
	_nombre = ["Otros", _otrosID, "Nombre", "STRING"] call iniDB_read;

	if (!isNil "_class" && {!isNil "_pos"}) then 
	{
	_dir = ["Otros", _otrosID, "Direction", "ARRAY"] call iniDB_read;
	_damage = ["Otros", _otrosID, "Damage", "SCALAR"] call iniDB_read;
	{ if (typeName _x == "STRING") then { _pos set [_forEachIndex, parseNumber _x] } } forEach _pos;
	_otros = createVehicle [_class, _pos, [], 0, "None"];
	_otros allowDamage false;
	_otros hideObjectGlobal true;
	_otros setPosWorld ATLtoASL _pos;
		if (!isNil "_dir") then
	{
	_otros setVectorDirAndUp _dir;
	};	
	_otros allowDamage true;
	_otros hideObjectGlobal false;
	if (_initobj = "tieneinit") then {
	[[[_otros, _nombre], "Inits\iniciacion2.sqf"], "BIS_fnc_execVM", true] call BIS_fnc_MP;

	};
	};
	
};
};
};