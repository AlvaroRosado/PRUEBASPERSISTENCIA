if (hasInterface && !isDedicated) then {
	waitUntil {!isNull player};
	player setVariable["nombre", profileName, true];
	player setVariable["cargacompleta", false, true];
	player setVariable["datos", [], true];
	player setVariable["rango", "PRIVATE", true];
	player setVariable["rol", "DEFAULT", true];
	player call fn_restoreHQ; 
};
	
	
	
	


