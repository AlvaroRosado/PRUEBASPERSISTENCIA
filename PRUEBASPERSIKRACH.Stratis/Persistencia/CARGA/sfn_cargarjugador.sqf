/*
	Author: Kingsley
	Description: Loads a players information from the database. This is a persistence function.
	Parameter(s): OBJECT - Player to be loaded
	Returns: ARRAY in format [ position, rotation, rank, tourCount, dateJoined, loadout, isNewPlayer, role ]
*/
#include "debug_console.hpp"

private ["_unit", "_puid", "_result", "_nombre", "_idplayer", "_prRank", "_pPos", "_pLoadout", "_pRank", "_pRot"];

_unit = _this select 0;
_unitLoadout = _this select 1;
_puid = getPlayerUID _unit;
_result = [];

_nombre = _unit getVariable["nombre", ""];
if (_nombre == "") exitWith {};
conYellow("Cogiendo datos jugador. Leyendo DB");
_idplayer = format["%1_%2", _puid, (_nombre call iniDB_CRC32)];

_prRank = ["jugadores", _idplayer, "rango", "STRING"] call iniDB_read;

if (_prRank == "") then {
	conRed("Guardando nuevo jugador");
	["jugadores", _idplayer, "posicion", (getPos _unit)] call iniDB_write;
	["jugadores", _idplayer, "rotacion", (getDir _unit)] call iniDB_write;
	["jugadores", _idplayer, "loadout", _unitLoadout] call iniDB_write;
	["jugadores", _idplayer, "rango", "PRIVATE"] call iniDB_write;
	["jugadores", _idplayer, "rol", "DEFAULT"] call iniDB_write;
	
	_unit setVariable["datos", [
		(getPos _unit),
		(getDir _unit),
		"PRIVATE",
		"0",
		date,
		_unitLoadout,
		true,
		"DEFAULT"
	], true];
	_result = true;
} else {
	conRed("Player existente");
	_pPos = ["jugadores", _idplayer, "posicion", "ARRAY"] call iniDB_read;
	_pRot = ["jugadores", _idplayer, "rotacion", "SCALAR"] call iniDB_read;
	_pRank = ["jugadores", _idplayer, "rango", "STRING"] call iniDB_read;
	_pLoadout = ["jugadores", _idplayer, "loadout", "ARRAY"] call iniDB_read;
	_pRole = ["jugadores", _idplayer, "rol", "STRING"] call iniDB_read;
	
	_unit setVariable["datos", [
		_pPos,
		_pRot,
		_pRank,
		_pLoadout,
		false,
		_pRole
	], true];
	
	
	_result = true;
};

_unit setVariable["cargacompleta", _result, true];

_result