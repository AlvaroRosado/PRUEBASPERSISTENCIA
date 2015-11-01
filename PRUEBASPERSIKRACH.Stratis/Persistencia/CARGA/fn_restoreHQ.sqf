_unit = _this;
_loadout = [_unit] call fn_getLoadout;

[[_unit, _loadout], "sfn_cargarjugador", false, false, true] call BIS_fnc_MP;

waitUntil { _unit getVariable["cargacompleta", false] };

_vcargacompleta = _unit getVariable["cargacompleta", false];
_vdatos = _unit getVariable["datos", []];






if (count _vdatos > 0 && _vcargacompleta) then {

	player setPos (getMarkerPos "respawn_west");
	
	while { alive _unit } do {
<<<<<<< HEAD
		//Hay que recordar quitar este sleep, por otro método para el problema del respawn
		sleep 15;
		_unit spawn fn_guardarjugador;
		sleep 10;
=======
		sleep 15;
		_unit spawn fn_guardarjugador;		
>>>>>>> origin/master
		};
};
