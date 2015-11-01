// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: fn_getObjectProperties.sqf
//	@file Author: AgentRev
private ["_obj", "_class", "_pos", "_dir", "_damage", "_allowDamage","_turretMags","_nombre", "_initobj"];
_obj = _this select 0;
_nombre = _this select 1;
_class = typeOf _obj;
_pos = ASLtoATL getPosWorld _obj;
_initobj = "n";
if !(isNil {_obj getVariable ["iniciacion", ""]}) then {_initobj = _obj getVariable ["iniciacion", ""]};

{ _pos set [_forEachIndex, _x call fn_numToStr] } forEach _pos;
_dir = [vectorDir _obj, vectorUp _obj];
_damage = damage _obj;
_allowDamage = if (_obj getVariable ["allowDamage", false]) then { 1 } else { 0 };
_turretMags = [];
[
	["Class", _class],
	["Nombre", _nombre],
	["Position", _pos],
	["Direction", _dir],
	["Damage", _damage],
	["AllowDamage", _allowDamage],
	["TurretMagazines", _turretMags],
	["Init", _initobj]

]
