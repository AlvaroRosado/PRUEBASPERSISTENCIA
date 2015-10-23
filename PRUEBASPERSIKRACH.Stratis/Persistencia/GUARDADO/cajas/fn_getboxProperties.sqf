// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: fn_getObjectProperties.sqf
//	@file Author: AgentRev


private ["_obj", "_class", "_pos", "_dir", "_damage", "_weapons", "_magazines", "_items", "_backpacks", "_turretMags", "_ammoCargo", "_fuelCargo", "_repairCargo"];
_obj = _this select 0;

_class = typeOf _obj;
_pos = ASLtoATL getPosWorld _obj;
{ _pos set [_forEachIndex, _x call fn_numToStr] } forEach _pos;
_dir = [vectorDir _obj, vectorUp _obj];
_damage = damage _obj;

_weapons = [];
_magazines = [];
_items = [];
_backpacks = [];

if (_class call fn_hasInventory) then
{
	_weapons = (getWeaponCargo _obj) call cargoToPairs;
	_magazines = (getMagazineCargo _obj) call cargoToPairs;
	_items = (getItemCargo _obj) call cargoToPairs;
	_backpacks = (getBackpackCargo _obj) call cargoToPairs;
};

_ammoCargo = getAmmoCargo _obj;
_fuelCargo = getFuelCargo _obj;
_repairCargo = getRepairCargo _obj;

// Fix for -1.#IND
if (isNil "_ammoCargo" || {!finite _ammoCargo}) then { _ammoCargo = 0 };
if (isNil "_fuelCargo" || {!finite _fuelCargo}) then { _fuelCargo = 0 };
if (isNil "_repairCargo" || {!finite _repairCargo}) then { _repairCargo = 0 };

[
	["Class", _class],
	["Position", _pos],
	["Direction", _dir],
	["Damage", _damage],

	["Weapons", _weapons],
	["Magazines", _magazines],
	["Items", _items],
	["Backpacks", _backpacks],

	["AmmoCargo", _ammoCargo],
	["FuelCargo", _fuelCargo],
	["RepairCargo", _repairCargo]
]