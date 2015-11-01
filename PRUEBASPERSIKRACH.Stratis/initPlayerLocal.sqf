//del else
waituntil {!(isnil "bis_fnc_init")};

if (hasInterface && !isDedicated) then {
	waitUntil {!isNull player};
	player setVariable["nombre", profileName, true];
	player setVariable["cargacompleta", false, true];
	player setVariable["datos", [], true];
	player setVariable["rango", "PRIVATE", true];
	player setVariable["rol", "DEFAULT", true];
	//player call fn_restoreplayer;
	
closeDialog 0;
		waitUntil {alive player};
	
		[]spawn {

		waitUntil {sleep 0.1; !isNull (findDisplay 46)};
		_dia1 = [
			parseText "Selecciona si deseas spawnear en HQ o en tu última posición guardada.",
			"Bienvenido Krachipersis",
			"HQ",
			"Ult.Posicion"
		] call bis_fnc_GUImessage;
			if ( _dia1 ) then {
			player call fn_restoreHQ; 
			} else {
			player call fn_restoreplayer;
			};

						//, _unit call fn_defaultLoadout,_unit call fn_restoreHQ , 
					   //_unit call fn_defaultLoadout,_unit call fn_restoreplayer
		};
	
	
};
	
	
	
	


