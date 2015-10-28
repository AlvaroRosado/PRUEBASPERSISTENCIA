//del else
	waitUntil {!isNull player};
	player setVariable["nombre", profileName, true];
	player setVariable["cargacompleta", false, true];
	player setVariable["datos", [], true];
	player setVariable["rango", "PRIVATE", true];
	player setVariable["rol", "DEFAULT", true];
	//player call fn_restoreplayer;
	
closeDialog 0;
[]spawn {

	waitUntil {sleep 0.1; !isNull (findDisplay 46)};
	_dia1 = [
		parseText "<img size='3' valign='top' align='center' image='media\esusmain.jpg'/><br/><br/><t align='center'>Selecciona si deseas spawnear en HQ o en tu última posición guardada.</t><br/><br/>",
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
