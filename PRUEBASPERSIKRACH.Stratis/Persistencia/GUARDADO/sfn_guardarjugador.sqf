/*
	Author: Kingsley
	Description: Saves a players data to the database. This is a persistence function.
	Parameter(s): OBJECT - Player to be saved
	Returns: BOOLEAN (returns true)
*/

private ["_unit", "_puid", "_result", "_nombre", "_unitFileName"];

_unit = _this select 0;
_loadoutToSave = _this select 1;
_puid = getPlayerUID _unit;
_result = [];

_nombre = _unit getVariable["nombre", ""];
if (_nombre == "") exitWith {};

_unitFileName = format["%1_%2", _puid, (_nombre call iniDB_CRC32)];

_useRank = _unit getVariable ["rango", "PRIVATE"];

["jugadores", _unitFileName, "posicion", (getPos _unit)] call iniDB_write;
["jugadores", _unitFileName, "rotacion", (getDir _unit)] call iniDB_write;
["jugadores", _unitFileName, "loadout", _loadoutToSave] call iniDB_write;
["jugadores", _unitFileName, "rango", _useRank] call iniDB_write;

_result = true;


_result