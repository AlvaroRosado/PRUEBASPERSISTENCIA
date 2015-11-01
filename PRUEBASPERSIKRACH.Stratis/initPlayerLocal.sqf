//del else
waituntil {!(isnil "bis_fnc_init")};

if (hasInterface && !isDedicated) then {
	waitUntil {!isNull player};
	player setVariable["nombre", profileName, true];
	player setVariable["cargacompleta", false, true];
	player setVariable["datos", [], true];
	player setVariable["rango", "PRIVATE", true];
	player setVariable["rol", "DEFAULT", true];
	
closeDialog 0;
		waitUntil {alive player};
	
		[]spawn {

		waitUntil {sleep 0.1; !isNull (findDisplay 46)};
		_dia1 = [
			parseText "Nuevo Jugador o Cargar Guardado",
			"Bienvenido Krachipersis",
			"Nuevo",
			"Cargar"
		] call bis_fnc_GUImessage;
			if ( _dia1 ) then {
			player call fn_restoreHQ; 
			} else {
			player call fn_restoreplayer;
			};
		};
	
	
};
	
	
	
	


