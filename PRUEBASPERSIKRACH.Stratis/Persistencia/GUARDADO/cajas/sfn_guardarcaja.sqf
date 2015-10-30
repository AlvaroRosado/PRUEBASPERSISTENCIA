_objcount = 0;
_obj = _this select 0;
_propiedad = _this select 2;
_objcount = _this select 1;
_objID = format ["caja%1", _objcount];
_result = [];
{
	["cajas", _objID, _x select 0, _x select 1] call iniDB_write; 
} forEach _propiedad;
_result = true;
_result