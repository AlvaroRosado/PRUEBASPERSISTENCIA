_vehCount = 0;
_veh = _this select 0;
_propiedad = _this select 2;
_vehCount = _this select 1;
_vehName = format ["Veh%1", _vehCount];
_result = [];
{
	["vehiculos", _vehName, _x select 0, _x select 1, false] call iniDB_write; 
} forEach _propiedad;
_result = true;
_result