_exists = "cajas" call iniDB_exists;
_objcount = 0;
if (!isNil "_exists" && {_exists}) then
{	
_objcount = ["cajas", "Info", "TOTAL", "STRING"] call iniDB_read;
_number = parseNumber _objcount;
if (_number > 0) then { 

{
		_caja =  _x;
		deleteVehicle _caja;
} forEach allMissionObjects "ReammoBox_F";
for [{_i=1},{_i<=_number},{_i=_i+1}] do {
	_cajaID = format ["caja%1", _i];
	_class = ["cajas", _cajaID, "Class", "STRING"] call iniDB_read;
	_pos = ["cajas", _cajaID, "Position", "ARRAY"] call iniDB_read;
	if (!isNil "_class" && {!isNil "_pos"}) then 
	{
	_dir = ["cajas", _cajaID, "Direction", "ARRAY"] call iniDB_read;
	_damage = ["cajas", _cajaID, "Damage", "SCALAR"] call iniDB_read;
	_weapons = ["cajas", _cajaID, "Weapons", "ARRAY"] call iniDB_read;
	_magazines = ["cajas", _cajaID, "Magazines", "ARRAY"] call iniDB_read;
	_items = ["cajas", _cajaID, "Items", "ARRAY"] call iniDB_read;
	_backpacks = ["cajas", _cajaID, "Backpacks", "ARRAY"] call iniDB_read;
	{ if (typeName _x == "STRING") then { _pos set [_forEachIndex, parseNumber _x] } } forEach _pos;
	_caja = createVehicle [_class, _pos, [], 0, "None"];
	_caja setPosWorld ATLtoASL _pos;
		if (!isNil "_dir") then
	{
	_caja setVectorDirAndUp _dir;
	};	
	_caja allowDamage false;
	_caja hideObjectGlobal true;
	clearWeaponCargoGlobal _caja;
	clearMagazineCargoGlobal _caja;
	clearItemCargoGlobal _caja;
	clearBackpackCargoGlobal _caja;
	if (!isNil "_weapons") then
	{
	{ _caja addWeaponCargoGlobal _x } forEach _weapons;
	};
	if (!isNil "_magazines") then
	{
	{ _caja addMagazineCargoGlobal _x } forEach _magazines;
	};
	if (!isNil "_items") then
	{
	{ _caja addItemCargoGlobal _x } forEach _items;
	};
	if (!isNil "_backpacks") then
	{
	{ _caja addBackpackCargoGlobal _x } forEach _backpacks;
	};
	_caja allowDamage true;
	_caja hideObjectGlobal false;
	};
	
};
};
};