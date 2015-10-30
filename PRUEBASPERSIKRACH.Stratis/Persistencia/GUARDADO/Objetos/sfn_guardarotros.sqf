_otrosCount = 0;
_otros = _this select 0;
_otrosCount = _this select 1;
_propiedad = _this select 2;
_otrosName = format ["obj%1", _otrosCount];
_result = [];
{
	["Otros", _otrosName, _x select 0, _x select 1, false] call iniDB_write; 
} forEach _propiedad;
_result = true;
_result