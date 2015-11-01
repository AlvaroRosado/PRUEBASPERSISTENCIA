

//Añadimos variables
	waitUntil {!isNull player};
	player setVariable["nombre", profileName, true];
	player setVariable["cargacompleta", false, true];
	player setVariable["datos", [], true];
	player setVariable["rango", "PRIVATE", true];
	

// Salimos en HQ
	
	player call fn_restoreHQ;