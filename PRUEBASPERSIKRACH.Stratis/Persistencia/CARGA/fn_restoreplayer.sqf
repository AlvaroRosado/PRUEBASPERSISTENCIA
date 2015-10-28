_unit = _this;
_loadout = [_unit] call fn_getLoadout;

[[_unit, _loadout], "sfn_cargarjugador", false, false, true] call BIS_fnc_MP;

waitUntil { _unit getVariable["cargacompleta", false] };

_vcargacompleta = _unit getVariable["cargacompleta", false];
_vdatos = _unit getVariable["datos", []];

if (count _vdatos > 0 && _vcargacompleta) then {
	_unit setPos (_vdatos select 0);
	_unit setDir (_vdatos select 1);
	_unit setRank (_vdatos select 2);
	[_unit, _vdatos select 3] call fn_setLoadout;
	_unit setVariable ["rango", _vdatos select 2, true];
	_unit setVariable ["rol", _vdatos select 5, true];

	if (_vdatos select 6) then {
	};
		
	while { alive _unit } do {
		
		_unit spawn fn_guardarjugador;
		sleep 10;
		};
};
