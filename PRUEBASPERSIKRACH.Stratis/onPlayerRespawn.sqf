

//Añadimos variables

		_unit setVariable["nombre", profileName, true];
		_unit setVariable["cargacompleta", false, true];
		_unit setVariable["datos", [], true];
		_unit setVariable["rango", "PRIVATE", true];


// Salimos en HQ

	player call fn_restoreHQ;