_unit = _this select 0;
_oldUnit = _this select 1;

removeAllActions _oldUnit;

waitUntil {!isNull _unit};
waitUntil {time > 0};

_unit setVariable["nombre", profileName, true];
_unit setVariable["cargacompleta", false, true];
_unit setVariable["datos", [], true];
_unit setVariable["rango", "PRIVATE", true];
_unit setVariable["rol", "DEFAULT", true];
_unit call fn_defaultLoadout;
_unit call fn_cargarjugador;

